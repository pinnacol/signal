module Inploy
  module Templates
    module Pinnacol
      def self.extended(base)
        base.path = nil
      end

      def remote_setup
        remote_run "rm -rf #{application_path}"
        remote_run "rm -r #{passenger_deploy_path}"
        remote_run "cd #{path} && #{sudo_if_should}git clone --depth 1 #{repository} #{application}"
        remote_run "cd #{application_path} && #{checkout}"
        remote_run "cd #{application_path} && #{bundle}"
        remote_run "ln -s #{application_path}/public #{passenger_deploy_path}"
      end

      def path
        @path ||= "/var/www/rails-apps"
      end

      private
        def passenger_deploy_path
          @passenger_deploy_path || "/var/www/passenger/#{application_folder}"
        end

        def checkout
          branch.eql?("master") ? "" : "git checkout -f -b #{branch} origin/#{branch}"
        end

        def bundle
          "#{bundle_cmd}" if using_bundler?
        end
      # end private
    end
  end
end
