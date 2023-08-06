module Deku.DOM.Attr.Muted where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.Audio (Audio_)
import Deku.DOM.Elt.Video (Video_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Muted = Muted

instance Attr Audio_ Muted  String  where
  attr Muted value = unsafeAttribute $ Left $  
    { key: "muted", value: prop' value }
instance Attr Audio_ Muted (Event.Event  String ) where
  attr Muted eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "muted", value: prop' value }


instance Attr Video_ Muted  String  where
  attr Muted value = unsafeAttribute $ Left $  
    { key: "muted", value: prop' value }
instance Attr Video_ Muted (Event.Event  String ) where
  attr Muted eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "muted", value: prop' value }


instance Attr everything Muted  Unit  where
  attr Muted _ = unsafeAttribute $ Left $  { key: "muted", value: unset' }
instance Attr everything Muted (Event.Event  Unit ) where
  attr Muted eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "muted", value: unset' }
