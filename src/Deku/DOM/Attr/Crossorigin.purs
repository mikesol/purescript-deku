module Deku.DOM.Attr.Crossorigin where
import Prelude
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
  attr Crossorigin value = unsafeAttribute (  
    { key: "crossorigin", value: prop' value  } <$ _)
instance Attr Audio_ Crossorigin (Event.Event Unit -> Event.Event  String ) where
  attr Crossorigin eventValue = unsafeAttribute (map (map (
    \value -> { key: "crossorigin", value: prop' value })) eventValue)
instance Attr Audio_ Crossorigin (Event.Event  String ) where
  attr Crossorigin eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "crossorigin", value: prop' value }
instance Attr Img_ Crossorigin  String  where
  attr Crossorigin value = unsafeAttribute (  
    { key: "crossorigin", value: prop' value  } <$ _)
instance Attr Img_ Crossorigin (Event.Event Unit -> Event.Event  String ) where
  attr Crossorigin eventValue = unsafeAttribute (map (map (
    \value -> { key: "crossorigin", value: prop' value })) eventValue)
instance Attr Img_ Crossorigin (Event.Event  String ) where
  attr Crossorigin eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "crossorigin", value: prop' value }
instance Attr Link_ Crossorigin  String  where
  attr Crossorigin value = unsafeAttribute (  
    { key: "crossorigin", value: prop' value  } <$ _)
instance Attr Link_ Crossorigin (Event.Event Unit -> Event.Event  String ) where
  attr Crossorigin eventValue = unsafeAttribute (map (map (
    \value -> { key: "crossorigin", value: prop' value })) eventValue)
instance Attr Link_ Crossorigin (Event.Event  String ) where
  attr Crossorigin eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "crossorigin", value: prop' value }
instance Attr Script_ Crossorigin  String  where
  attr Crossorigin value = unsafeAttribute (  
    { key: "crossorigin", value: prop' value  } <$ _)
instance Attr Script_ Crossorigin (Event.Event Unit -> Event.Event  String ) where
  attr Crossorigin eventValue = unsafeAttribute (map (map (
    \value -> { key: "crossorigin", value: prop' value })) eventValue)
instance Attr Script_ Crossorigin (Event.Event  String ) where
  attr Crossorigin eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "crossorigin", value: prop' value }
instance Attr Video_ Crossorigin  String  where
  attr Crossorigin value = unsafeAttribute (  
    { key: "crossorigin", value: prop' value  } <$ _)
instance Attr Video_ Crossorigin (Event.Event Unit -> Event.Event  String ) where
  attr Crossorigin eventValue = unsafeAttribute (map (map (
    \value -> { key: "crossorigin", value: prop' value })) eventValue)
instance Attr Video_ Crossorigin (Event.Event  String ) where
  attr Crossorigin eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "crossorigin", value: prop' value }
instance Attr Image_ Crossorigin  String  where
  attr Crossorigin value = unsafeAttribute (  
    { key: "crossorigin", value: prop' value  } <$ _)
instance Attr Image_ Crossorigin (Event.Event Unit -> Event.Event  String ) where
  attr Crossorigin eventValue = unsafeAttribute (map (map (
    \value -> { key: "crossorigin", value: prop' value })) eventValue)
instance Attr Image_ Crossorigin (Event.Event  String ) where
  attr Crossorigin eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "crossorigin", value: prop' value }
instance Attr everything Crossorigin  Unit  where
  attr Crossorigin _ = unsafeAttribute (  
    { key: "crossorigin", value: unset'  } <$ _)
instance Attr everything Crossorigin (Event.Event Unit -> Event.Event  Unit ) where
  attr Crossorigin eventValue = unsafeAttribute (map (map (
    \_ -> { key: "crossorigin", value: unset' })) eventValue)
instance Attr everything Crossorigin (Event.Event  Unit ) where
  attr Crossorigin eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "crossorigin", value: unset' }