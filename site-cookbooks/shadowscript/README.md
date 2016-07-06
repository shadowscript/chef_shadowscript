# Shadowscript Cookbook

This Cookbook is a ready to use cookbook for provisioning servers



## Requirements
It can be used for:
 - `Ruby Rails`
 - In progress `{Django applications}`
 
### Platforms

- Ubuntu
- Fedora

### Chef

- Chef 12.0 or later

### Cookbooks


## Attributes

## Recipes
- PostgreSQL
- RVM
- Apache2
- Nodejs
- Redis
- Passenger(in progress)



### Shadowscript::default

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['Shadowscript']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

### Shadowscript::default

TODO: Write usage instructions for each cookbook.

e.g.
Just include `Shadowscript` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[Shadowscript]"
  ]
}
```

## Contributing


1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

## License and Authors
  Author Eric Caleb / Shadowscript
  The MIT License (MIT)
  Copyright (c) 2016 Shadowscript
  Copyright (c) 2016 Eric Caleb

  Shadowscript
  Eric Caleb
