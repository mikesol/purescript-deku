module Deku.DOM.Attr.Scope where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Th (Th_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Scope = Scope

instance Attr Th_ Scope (NonEmpty.NonEmpty Event.Event  String ) where
  attr Scope bothValues = unsafeAttribute $ Both (pure 
    { key: "scope", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "scope", value: prop' value })
instance Attr Th_ Scope  String  where
  attr Scope value = unsafeAttribute $ This $ pure $
    { key: "scope", value: prop' value }
instance Attr Th_ Scope (Event.Event  String ) where
  attr Scope eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "scope", value: prop' value }

instance Attr everything Scope (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Scope bothValues = unsafeAttribute $ Both (pure  { key: "scope", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "scope", value: unset' })
instance Attr everything Scope  Unit  where
  attr Scope _ = unsafeAttribute $ This $ pure $ { key: "scope", value: unset' }
instance Attr everything Scope (Event.Event  Unit ) where
  attr Scope eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "scope", value: unset' }
