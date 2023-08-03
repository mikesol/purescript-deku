module Deku.DOM.Attr.Fr where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Fr = Fr

instance Attr RadialGradient_ Fr (NonEmpty.NonEmpty Event.Event  String ) where
  attr Fr bothValues = unsafeAttribute $ Both (pure 
    { key: "fr", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fr", value: prop' value })
instance Attr RadialGradient_ Fr  String  where
  attr Fr value = unsafeAttribute $ This $ pure $ { key: "fr", value: prop' value }
instance Attr RadialGradient_ Fr (Event.Event  String ) where
  attr Fr eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "fr", value: prop' value }

instance Attr everything Fr (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Fr bothValues = unsafeAttribute $ Both (pure  { key: "fr", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "fr", value: unset' })
instance Attr everything Fr  Unit  where
  attr Fr _ = unsafeAttribute $ This $ pure $ { key: "fr", value: unset' }
instance Attr everything Fr (Event.Event  Unit ) where
  attr Fr eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "fr", value: unset' }
