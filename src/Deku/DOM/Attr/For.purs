module Deku.DOM.Attr.For where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Label (Label_)
import Deku.DOM.Elt.Output (Output_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data For = For

instance Attr Label_ For (NonEmpty.NonEmpty Event.Event  String ) where
  attr For bothValues = unsafeAttribute $ Both (pure 
    { key: "for", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "for", value: prop' value })
instance Attr Label_ For  String  where
  attr For value = unsafeAttribute $ This $ pure $ { key: "for", value: prop' value }
instance Attr Label_ For (Event.Event  String ) where
  attr For eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "for", value: prop' value }

instance Attr Output_ For (NonEmpty.NonEmpty Event.Event  String ) where
  attr For bothValues = unsafeAttribute $ Both (pure 
    { key: "for", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "for", value: prop' value })
instance Attr Output_ For  String  where
  attr For value = unsafeAttribute $ This $ pure $ { key: "for", value: prop' value }
instance Attr Output_ For (Event.Event  String ) where
  attr For eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "for", value: prop' value }

instance Attr everything For (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr For bothValues = unsafeAttribute $ Both (pure  { key: "for", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "for", value: unset' })
instance Attr everything For  Unit  where
  attr For _ = unsafeAttribute $ This $ pure $ { key: "for", value: unset' }
instance Attr everything For (Event.Event  Unit ) where
  attr For eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "for", value: unset' }
