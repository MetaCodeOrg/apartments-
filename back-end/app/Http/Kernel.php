<?php

namespace App\Http;

use Illuminate\Foundation\Http\Kernel as HttpKernel;

class Kernel extends HttpKernel
{
    protected $middleware = [
        \Illuminate\Http\Middleware\HandleCors::class,
        // ... other middleware
    ];

    protected $middlewareGroups = [
        'web' => [
            // ... web middleware
        ],
        
        'api' => [
            // ... other api middleware
        ],
    ];

    protected $routeMiddleware = [
        // ... other route middleware
        'cors' => \App\Http\Middleware\Cors::class,
        'json.response' => \App\Http\Middleware\ForceJsonResponse::class,
    ];
}