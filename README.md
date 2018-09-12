# DLua

Lua(v5.3) C API binding.

## example

```d
import std.stdio;
import std.string;
import dlua;

void main()
{
  auto L = luaL_newstate();
  L.luaL_dostring(`print("Hello World from Lua!")`.toStringz);
}
```

## usage

write below to your "dependencies" of dub.json/dub.sdl.

```json
"dependencies": {
  "dlua": "~>0.0.1"
}
```

## LICENSE

MIT

