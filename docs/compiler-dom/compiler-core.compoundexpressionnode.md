<!-- Do not edit this file. It is automatically generated by API Documenter. -->

[Home](./index.md) &gt; [@vue/compiler-core](./compiler-core.md) &gt; [CompoundExpressionNode](./compiler-core.compoundexpressionnode.md)

## CompoundExpressionNode interface

<b>Signature:</b>

```typescript
export interface CompoundExpressionNode extends Node 
```
<b>Extends:</b> Node

## Properties

|  Property | Type | Description |
|  --- | --- | --- |
|  [children](./compiler-core.compoundexpressionnode.children.md) | ([SimpleExpressionNode](./compiler-core.simpleexpressionnode.md) \| [CompoundExpressionNode](./compiler-core.compoundexpressionnode.md) \| [InterpolationNode](./compiler-core.interpolationnode.md) \| [TextNode](./compiler-core.textnode.md) \| string \| symbol)\[\] |  |
|  [identifiers](./compiler-core.compoundexpressionnode.identifiers.md) | string\[\] | an expression parsed as the params of a function will track the identifiers declared inside the function body. |
|  [type](./compiler-core.compoundexpressionnode.type.md) | [NodeTypes.COMPOUND\_EXPRESSION](./compiler-core.nodetypes.compound_expression.md) |  |

