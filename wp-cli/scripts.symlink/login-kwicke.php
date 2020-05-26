<?php
class Login_Kwicke {
    public function __invoke( $args ) {
        $response = WP_CLI::launch_self( 'user list --role=administrator', [], [ 'format' => 'json' ], false, true );
        $options = [
            'return' => 'all'
        ];
        $response = WP_CLI::runcommand('user list --role=administrator --format=json', $options);

        $user = json_decode($response->stdout);

        $login_command = WP_CLI::runcommand('login as ' . $user[0]->user_login , $options);

        $output = $login_command->stdout;

        print_r($output);
    }

}

WP_CLI::add_command( 'login kwicke', 'Login_Kwicke' );
