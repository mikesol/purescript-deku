module Deku.DOM.Attr.Label where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.Optgroup (Optgroup_)
import Deku.DOM.Elt.Option (Option_)
import Deku.DOM.Elt.Track (Track_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Label = Label

instance Attr Optgroup_ Label  String  where
  attr Label value = unsafeAttribute $ Left $  
    { key: "label", value: prop' value }
instance Attr Optgroup_ Label (Event.Event  String ) where
  attr Label eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "label", value: prop' value }


instance Attr Option_ Label  String  where
  attr Label value = unsafeAttribute $ Left $  
    { key: "label", value: prop' value }
instance Attr Option_ Label (Event.Event  String ) where
  attr Label eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "label", value: prop' value }


instance Attr Track_ Label  String  where
  attr Label value = unsafeAttribute $ Left $  
    { key: "label", value: prop' value }
instance Attr Track_ Label (Event.Event  String ) where
  attr Label eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "label", value: prop' value }


instance Attr everything Label  Unit  where
  attr Label _ = unsafeAttribute $ Left $  { key: "label", value: unset' }
instance Attr everything Label (Event.Event  Unit ) where
  attr Label eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "label", value: unset' }
