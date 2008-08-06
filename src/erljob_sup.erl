%% @author Masahito Ikuta <cooldaemon@gmail.com> [http://d.hatena.ne.jp/cooldaemon/]
%% @copyright Masahito Ikuta 2008
%% @doc A supervisor for the erljob.

%% Copyright 2008 Masahito Ikuta
%%
%% Licensed under the Apache License, Version 2.0 (the "License");
%% you may not use this file except in compliance with the License.
%% You may obtain a copy of the License at
%%
%% http://www.apache.org/licenses/LICENSE-2.0
%%
%% Unless required by applicable law or agreed to in writing, software
%% distributed under the License is distributed on an "AS IS" BASIS,
%% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%% See the License for the specific language governing permissions and
%% limitations under the License.

-module(erljob_sup).
-behaviour(supervisor).

-export([start_link/0, stop/0]).
-export([init/1]).

start_link() -> sup_utils:start_link(?MODULE).

stop() -> sup_utils:stop(?MODULE).

init(_Args) ->
  sup_utils:spec([
    {worker, erljob_status},
    {worker, erljob_cleaner},
    {sup, erljob_controller_sup_sup}
  ]).

