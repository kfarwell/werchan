<!DOCTYPE HTML>
<html>
<head>

    <title>%($pageTitle%)</title>

    <link rel="stylesheet" href="/pub/style/style.css" type="text/css" media="screen, handheld" title="default">
    <link rel="shortcut icon" href="/favicon.ico" type="image/vnd.microsoft.icon">
% if (~ `{get_cookie style} '')
%   echo '    <link rel="stylesheet" href="/_werc/pub/burichan.css" type="text/css" media="screen" title="default">'
    <link rel="stylesheet" href="/_werc/pub/%(`{get_cookie style}%).css" type="text/css" media="screen" title="default">
    <link rel="stylesheet" href="/pub/style/mobile.css" type="text/css" media="(max-device-width: 60em)" title="default">

    <meta charset="UTF-8">
% # Legacy charset declaration for backards compatibility with non-html5 browsers.
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 

% if(! ~ $#meta_description 0)
%   echo '    <meta name="description" content="'$"meta_description'">'
% if(! ~ $#meta_keywords 0)
%   echo '    <meta name="keywords" content="'$"meta_keywords'">'

% h = `{get_lib_file headers.inc}
% if(! ~ $#h 0)
%   cat $h

    %($"extraHeaders%)

</head>
<body>

