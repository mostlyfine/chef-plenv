plenv Cookbook
==============
Manages plenv and its installed plenv and cpanm.

Requirements
------------
- `build-essential`
- `curl`

Attributes
----------

#### plenv::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['plenv']['user']</tt></td>
    <td>String</td>
    <td>author user name</td>
    <td><tt>root</tt></td>
  </tr>
  <tr>
    <td><tt>['plenv']['group']</tt></td>
    <td>String</td>
    <td>author group name</td>
    <td><tt>plenv</tt></td>
  </tr>
  <tr>
    <td><tt>['plenv']['members']</tt></td>
    <td>Array</td>
    <td>group members</td>
    <td><tt>['root']</tt></td>
  </tr>
  <tr>
    <td><tt>['plenv']['plenv_root']</tt></td>
    <td>String</td>
    <td>plenv install directory</td>
    <td><tt>/usr/local/plenv</tt></td>
  </tr>
  <tr>
    <td><tt>['plenv']['profile_path']</tt></td>
    <td>String</td>
    <td>add `plenv` init to your shell to enable shims.</td>
    <td><tt>/etc/profile.d</tt></td>
  </tr>
  <tr>
    <td><tt>['plenv']['build']</tt></td>
    <td>Array</td>
    <td>perl versions to builded.</td>
    <td><tt>['5.18.2']</tt></td>
  </tr>
  <tr>
    <td><tt>['plenv']['global']</tt></td>
    <td>String</td>
    <td>set global this perl version.</td>
    <td><tt>'5.18.2'</tt></td>
  </tr>
</table>

Usage
----------
#### plenv::default
Create user, group and checkout for repository.
Just include `plenv` in your node's `run_list`:
```json
{
  "run_list": [
    "recipe[plenv]"
  ]
}
```

#### plenv::install
Build perl and set default version.
```json
{
  "run_list": [
    "recipe[plenv::install]"
  ]
}
```

```json
{
  "plenv": {
    "user": "taro",
    "plenv_root": "/home/taro/.plenv",
    "profile_path": "/home/taro/.plenv"
  },
  "run_list": [
    "recipe[plenv::default]"
    "recipe[plenv::install]"
  ]
}
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
MIT, Authors: mostlyfine
