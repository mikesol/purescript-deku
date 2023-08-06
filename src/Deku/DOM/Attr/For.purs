module Deku.DOM.Attr.For where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.Label (Label_)
import Deku.DOM.Elt.Output (Output_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data For = For

instance Attr Label_ For  String  where
  attr For value = unsafeAttribute $ Left $  { key: "for", value: prop' value }
instance Attr Label_ For (Event.Event  String ) where
  attr For eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "for", value: prop' value }


instance Attr Output_ For  String  where
  attr For value = unsafeAttribute $ Left $  { key: "for", value: prop' value }
instance Attr Output_ For (Event.Event  String ) where
  attr For eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "for", value: prop' value }


instance Attr everything For  Unit  where
  attr For _ = unsafeAttribute $ Left $  { key: "for", value: unset' }
instance Attr everything For (Event.Event  Unit ) where
  attr For eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "for", value: unset' }
