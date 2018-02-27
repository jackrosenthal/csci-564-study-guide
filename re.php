<?php
$re = '/\\\\DUadmonition\[([^\]-]*)(?:-[^\]]*)?\]\{\n\\\\DUtitle\[\1(?:-[^\]]*)?\]\{([^}]*)\}\n((?:[^{}]++|\{(?3)\})*)\}/smx';
$data = stream_get_contents(STDIN);
while (preg_match($re, $data)) {
    $data = preg_replace($re, '\\\\begin{\1box}{\2}' . "\n" . '\3' . "\n" . '\\\\end{\1box}', $data);
}
echo $data;
