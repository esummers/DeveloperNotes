# Preference Manifest File Format

Source:

- [Preference Manifest Format](https://mosen.github.io/profiledocs/manifest.html)

## Manifest File Format

The manifest file format originates with ManagedClient on Mac OS X 10.6 (maybe even earlier).

At a basic level, it is a plist file that describes the structure of another plist file. It also contains information about which keys are dependent on other parts of the plist.

Some keys have been added for the newer configuration profile system as you can see from the manifests included with Apple Configurator 2.

This document is a basic attempt to document the format. All of the payload documentation is generated from these files.

### Basic Keys

pfm_name Type String – The name of the plist key. Does not appear at the root level.

pfm_description Type String – This key describes either the payload, or the purpose of the key it is associated with.

pfm_title Type String – The title of the key or payload, usually just a short name or title version of the key.

pfm_format_version Type Integer – The version of the pfm format in use, should usually be 1

pfm_version Type Integer – The version of this specific manifest.

pfm_domain Type String – This should now be equal to the PayloadType. This was previously used to indicate the preference domain in MCX manifests.

pfm_subkeys Type Array of Dict – This key describes keys nested under the current key.

* If the current key is of type array, the first subkey item describes the format of each array item.
* If the current key is of type dictionary, the subkeys are treated as dictionary members.

pfm_type Type String – The data type of the plist value associated with this key. Does not appear at the root level.

* boolean
* integer
* real
* string
* array
* dictionary
* data
* date

pfm_default Type Varies, depends on pfm_type. – The default value to suggest when creating new profiles. If the pfm_type is array or dict it can contain an entire structured value.

pfm_range_list Type Array of pfm_type. – A list of valid values.

pfm_range_min Type Integer or Real minimum value (if pfm_type is integer or real)

pfm_range_max Type Integer or Real maximum value (if pfm_type is integer or real) – There exist a typo in some manifests where this key is named: “pmf_range_max”

pfm_format Type String – A regular expression that the value must match.

pfm_require Type String, one of “always”, “push” – Indicates whether this key is required to be present.

* Always means that the key is absolutely required.
* Push means the profile will require user interaction to install if this key is omitted. If attempting to install automatically, the profile installation will fail. 

pfm_required
Type
Boolean or String “always”

Indicates whether this key is required to be present.

* Always or boolean true means that the key is absolutely required.

pfm_repetition_min
Type

Integer representing the minimum number of times this key needs to appear.

Prior to pfm_require this was used to specify optional and required keys. It is still in use for array pairs such as com.apple.security.scep Subject.

pfm_repetition_max
Type
Integer representing the maximum number of times this key can to appear.

pfm_exclude
Type
Array of conditions dicts

Indicates the conditions where this key should not be required. The dict should contain a pfm_target_conditions.

pfm_conditionals
Type
Array of conditions dicts

Indicates the conditions where this key WILL be enabled. The dict should contain a pfm_target_conditions.

pfm_targets (MCX)
Type
Array of String

This key appears in the older MCX manifest style but not in AC 2. It seems to describe the scopes where the payload will be valid.

Valid values are:

* user
* user-managed
* system
* system-managed

The -managed suffix seems to infer that the key will be FORCED.

> Note: Needs clarification

### Conditions

pfm_target_conditions
Type
Array of dicts

Specifies a key that this key depends on, and what the value should be to satisfy this condition.

Example:

```
<key>pfm_target_conditions</key>
<array>
    <dict>
        <key>pfm_target</key>
        <string>DomainName</string>
        <key>pfm_present</key>
        <false/>
    </dict>
</array>
```

The value of pfm_target in this case refers to another key called DomainName. The condition, pfm_present says that this key must not be present to satisfy the condition.

If this condition is a child of pfm_exclude then the condition is “inverted”. The key will not be required unless this condition is not satisfied.

pfm_target
Type
String

This key is part of a set of conditions and specifies the target key to evaluate. For nested keys the key names can be separated by a dot “.”

pfm_present
Type
Boolean

This rule evaluates whether the target key exists or not. If true, the target must be present.

pfm_contains_any
Type
Array of target pfm_type

This rule will pass if the target exists in any of the values listed in the array.

pfm_n_contains_any
Type
Array of target pfm_type

This rule will pass if the target doesn’t match any value listed in the array.

pfm_range_list
Type
Array of target pfm_type

This rule will pass if the value of the target matches the list.

pfm_n_range_list
Type
Array of target pfm_type

This rule will pass if the value of the target does not match the list.

Union Policies (MCX)

The union policy type appears in older MCX style manifests (originally occurring in OS X Server 10.4-10.6).

pfm_upk_input_keys
Type
Array of key names which will be processed to produce an output key

Usually refers to a key name with a -Raw suffix that will be processed to produce the actual key.

pfm_upk_output_name
Type
String describing the name of the key after processing.

pfm_upk_output_type
Type
Normal pfm_type that will be generated

pfm_remove_duplicates
