module Deku.DOM.Attr.Crossorigin where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.Image (Image_)
import Deku.DOM.Elt.Audio (Audio_)
import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Link (Link_)
import Deku.DOM.Elt.Script (Script_)
import Deku.DOM.Elt.Video (Video_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Crossorigin = Crossorigin

instance Attr Audio_ Crossorigin  String  where
  attr Crossorigin value = unsafeAttribute $ Left $  
    { key: "crossorigin", value: prop' value }
instance Attr Audio_ Crossorigin (Event.Event  String ) where
  attr Crossorigin eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "crossorigin", value: prop' value }


instance Attr Img_ Crossorigin  String  where
  attr Crossorigin value = unsafeAttribute $ Left $  
    { key: "crossorigin", value: prop' value }
instance Attr Img_ Crossorigin (Event.Event  String ) where
  attr Crossorigin eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "crossorigin", value: prop' value }


instance Attr Link_ Crossorigin  String  where
  attr Crossorigin value = unsafeAttribute $ Left $  
    { key: "crossorigin", value: prop' value }
instance Attr Link_ Crossorigin (Event.Event  String ) where
  attr Crossorigin eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "crossorigin", value: prop' value }


instance Attr Script_ Crossorigin  String  where
  attr Crossorigin value = unsafeAttribute $ Left $  
    { key: "crossorigin", value: prop' value }
instance Attr Script_ Crossorigin (Event.Event  String ) where
  attr Crossorigin eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "crossorigin", value: prop' value }


instance Attr Video_ Crossorigin  String  where
  attr Crossorigin value = unsafeAttribute $ Left $  
    { key: "crossorigin", value: prop' value }
instance Attr Video_ Crossorigin (Event.Event  String ) where
  attr Crossorigin eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "crossorigin", value: prop' value }


instance Attr Image_ Crossorigin  String  where
  attr Crossorigin value = unsafeAttribute $ Left $  
    { key: "crossorigin", value: prop' value }
instance Attr Image_ Crossorigin (Event.Event  String ) where
  attr Crossorigin eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "crossorigin", value: prop' value }


instance Attr everything Crossorigin  Unit  where
  attr Crossorigin _ = unsafeAttribute $ Left $  
    { key: "crossorigin", value: unset' }
instance Attr everything Crossorigin (Event.Event  Unit ) where
  attr Crossorigin eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "crossorigin", value: unset' }
