<?php
class Get_Admins {
    public function __invoke( $args ) {
        $response = WP_CLI::launch_self( 'user list --role=administrator', [], [ 'format' => 'json' ], false, true );
        $users = json_decode( $response->stdout );
        WP_CLI\Utils\format_items( 'table', $users, [ 'ID', 'user_login', 'display_name', 'roles' ] );
    }
}
WP_CLI::add_command( 'user admins', 'Get_Admins' );
