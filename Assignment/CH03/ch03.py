import pydash
  
def find_nested_value(objt, key):
    key = key.replace('/', '.')
    try:
value = pydash.get(objt, key)
return value
    except pydash.exceptions.KeyError:
return None

object_1 = {"a": {"b": {"c": "d"}}}
key_1 = "a/b/c"
value_1 = find_nested_value(object_1, key_1)
print(f"Value 1: {value_1}")

object_2 = {"x": {"y": {"z": "a"}}}
key_2 = "x/y/z"
value_2 = find_nested_value(object_2, key_2)
print(f"Value 2: {value_2}")