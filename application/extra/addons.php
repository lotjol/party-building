<?php

return [
    'autoload' => false,
    'hooks' => [
        'upgrade' => [
            'cms',
        ],
        'app_init' => [
            'cms',
        ],
        'action_begin' => [
            'cms',
        ],
        'view_filter' => [
            'cms',
        ],
        'user_sidenav_after' => [
            'cms',
        ],
        'xunsearch_config_init' => [
            'cms',
        ],
        'xunsearch_index_reset' => [
            'cms',
        ],
        'wipecache_after' => [
            'tinymce',
        ],
        'set_tinymce' => [
            'tinymce',
        ],
    ],
    'route' => [
        '/$' => 'cms/index/index',
        '/t/[:diyname]$' => 'cms/tag/index',
        '/p/[:diyname]$' => 'cms/page/index',
        '/s$' => 'cms/search/index',
        '/d/[:diyname]$' => 'cms/diyform/index',
        '/d/[:diyname]/post' => 'cms/diyform/post',
        '/d/[:diyname]/[:id]' => 'cms/diyform/show',
        '/special/[:diyname]' => 'cms/special/index',
        '/u/[:id]' => 'cms/user/index',
        '/[:diyname]$' => 'cms/channel/index',
        '/[:catename]/[:id]$' => 'cms/archives/index',
    ],
    'priority' => [],
    'domain' => '',
];
