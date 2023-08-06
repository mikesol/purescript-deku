module Deku.DOM.Attr.Controls where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.Audio (Audio_)
import Deku.DOM.Elt.Video (Video_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Controls = Controls

instance Attr Audio_ Controls  String  where
  attr Controls value = unsafeAttribute $ Left $  
    { key: "controls", value: prop' value }
instance Attr Audio_ Controls (Event.Event  String ) where
  attr Controls eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "controls", value: prop' value }


instance Attr Video_ Controls  String  where
  attr Controls value = unsafeAttribute $ Left $  
    { key: "controls", value: prop' value }
instance Attr Video_ Controls (Event.Event  String ) where
  attr Controls eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "controls", value: prop' value }


instance Attr everything Controls  Unit  where
  attr Controls _ = unsafeAttribute $ Left $  
    { key: "controls", value: unset' }
instance Attr everything Controls (Event.Event  Unit ) where
  attr Controls eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "controls", value: unset' }
