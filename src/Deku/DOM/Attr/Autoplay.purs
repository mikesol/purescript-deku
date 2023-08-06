module Deku.DOM.Attr.Autoplay where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.Audio (Audio_)
import Deku.DOM.Elt.Video (Video_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Autoplay = Autoplay

instance Attr Audio_ Autoplay  String  where
  attr Autoplay value = unsafeAttribute $ Left $  
    { key: "autoplay", value: prop' value }
instance Attr Audio_ Autoplay (Event.Event  String ) where
  attr Autoplay eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "autoplay", value: prop' value }


instance Attr Video_ Autoplay  String  where
  attr Autoplay value = unsafeAttribute $ Left $  
    { key: "autoplay", value: prop' value }
instance Attr Video_ Autoplay (Event.Event  String ) where
  attr Autoplay eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "autoplay", value: prop' value }


instance Attr everything Autoplay  Unit  where
  attr Autoplay _ = unsafeAttribute $ Left $  
    { key: "autoplay", value: unset' }
instance Attr everything Autoplay (Event.Event  Unit ) where
  attr Autoplay eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "autoplay", value: unset' }
