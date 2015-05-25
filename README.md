<h1>Currency Converter</h1>
<p>This currency converter was created using TDD. Here are some features:
  <ul>
    <li>The currency class is initialized with a value and a three-letter currency code.</li>
    <li>The currency converter class is initialized with a hash of currency codes and conversion rates.</li>
    <li>Currency objects with the same currency code can be added and subtracted by each other.</li>
    <li>If you try to add or subtract currency objects with different currency codes, it will raise a different currency code error.</li>
    <li>Currency objects can be multiplied by floats and fixnums</li>
    <li>If you try to multiply a currency object by something other than a float or fixnum, it will raise a custom error</li>
    <li>To make a currency exchange, run the "make_exchange" method on the currency converter object, and for arguments, give it the original currency object and the requested currency code.</li>
    <li>If the requested currency isn't known by the currency converter object, it will raise an unknown currency code error.</li>
  </ul>
</p>
