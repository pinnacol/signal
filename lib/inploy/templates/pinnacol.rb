module Inploy
  module Templates
    module Pinnacol
      def self.extended(base)
        base.path = nil
      end

      def local_setup
        super
        run "ln -s #{application_path}/public #{passenger_deploy_path}"
      end

      def path
        @path ||= "/var/www/rails-apps"
      end

      private
        def passenger_deploy_path
          @passenger_deploy_path || "/var/www/passenger/#{application}"
        end
      # end private
    end
  end
end
