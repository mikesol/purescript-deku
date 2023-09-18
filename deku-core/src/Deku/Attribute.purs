-- | Low-level, fine-grained control of attributes. For more high-level functions, see
-- | [Deku.Attributes](https://pursuit.purescript.org/packages/purescript-deku/docs/Deku.Attributes).
-- | In this module, you'll find functions to set and unset attributes and listeners on elements.
-- | There's also the `xdata` function that allows you to construct an aribitrary data attribute.
module Deku.Attribute (module Deku.Core)  where

import Deku.Core 
  ( Attribute
  , Attribute'
  , Key(..)
  , Value(..)
  , unsafeUnAttribute
  , unsafeAttribute
  , prop'
  , cb'
  , unset'
  , cb
  , Cb(..)
  , xdata
  )
