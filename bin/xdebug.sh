#!/bin/sh

export USER_ID=$(id -u)
export GROUP_ID=$(id -u)

# Find and replace everything after "xdebug.mode=" until end of the line with the argument and restart php-fpm container

# Documentation https://xdebug.org/docs/all_settings#mode

# off
# - Nothing is enabled. Xdebug does no work besides checking whether functionality is enabled. Use this setting if you want close to 0 overhead.

# develop
# - Enables Development Aids including the overloaded var_dump().

# coverage
# - Enables Code Coverage Analysis to generate code coverage reports, mainly in combination with PHPUnit.

# debug
# - Enables Step Debugging. This can be used to step through your code while it is running, and analyse values of variables.

# gcstats
# - Enables Garbage Collection Statistics to collect statistics about PHP's Garbage Collection Mechanism.

# profile
# - Enables Profiling, with which you can analyse performance bottlenecks with tools like KCacheGrind.

# trace
# - Enables the Function Trace feature, which allows you record every function call, including arguments, variable assignment, and return value that is made during a request to a file.

sed -i '' "s/xdebug.mode=.*/xdebug.mode=$1/g" docker/php-fpm/php.ini

docker-compose restart php-fpm