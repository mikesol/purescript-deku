module Deku.DOM.Attr.XlinkTitle where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.DOM.Elt.Pattern (Pattern_)
import Deku.DOM.Elt.Mpath (Mpath_)
import Deku.DOM.Elt.LinearGradient (LinearGradient_)
import Deku.DOM.Elt.Image (Image_)
import Deku.DOM.Elt.Filter (Filter_)
import Deku.DOM.Elt.FeImage (FeImage_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data XlinkTitle = XlinkTitle
instance Attr AnimateTransform_ XlinkTitle  String  where
  attr XlinkTitle value = unsafeAttribute (  
    { key: "xlink:title", value: prop' value  } <$ _)
instance Attr AnimateTransform_ XlinkTitle (Event.Event Unit -> Event.Event  String ) where
  attr XlinkTitle eventValue = unsafeAttribute (map (map (
    \value -> { key: "xlink:title", value: prop' value })) eventValue)
instance Attr AnimateTransform_ XlinkTitle (Event.Event  String ) where
  attr XlinkTitle eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "xlink:title", value: prop' value }
instance Attr FeImage_ XlinkTitle  String  where
  attr XlinkTitle value = unsafeAttribute (  
    { key: "xlink:title", value: prop' value  } <$ _)
instance Attr FeImage_ XlinkTitle (Event.Event Unit -> Event.Event  String ) where
  attr XlinkTitle eventValue = unsafeAttribute (map (map (
    \value -> { key: "xlink:title", value: prop' value })) eventValue)
instance Attr FeImage_ XlinkTitle (Event.Event  String ) where
  attr XlinkTitle eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "xlink:title", value: prop' value }
instance Attr Filter_ XlinkTitle  String  where
  attr XlinkTitle value = unsafeAttribute (  
    { key: "xlink:title", value: prop' value  } <$ _)
instance Attr Filter_ XlinkTitle (Event.Event Unit -> Event.Event  String ) where
  attr XlinkTitle eventValue = unsafeAttribute (map (map (
    \value -> { key: "xlink:title", value: prop' value })) eventValue)
instance Attr Filter_ XlinkTitle (Event.Event  String ) where
  attr XlinkTitle eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "xlink:title", value: prop' value }
instance Attr Image_ XlinkTitle  String  where
  attr XlinkTitle value = unsafeAttribute (  
    { key: "xlink:title", value: prop' value  } <$ _)
instance Attr Image_ XlinkTitle (Event.Event Unit -> Event.Event  String ) where
  attr XlinkTitle eventValue = unsafeAttribute (map (map (
    \value -> { key: "xlink:title", value: prop' value })) eventValue)
instance Attr Image_ XlinkTitle (Event.Event  String ) where
  attr XlinkTitle eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "xlink:title", value: prop' value }
instance Attr LinearGradient_ XlinkTitle  String  where
  attr XlinkTitle value = unsafeAttribute (  
    { key: "xlink:title", value: prop' value  } <$ _)
instance Attr LinearGradient_ XlinkTitle (Event.Event Unit -> Event.Event  String ) where
  attr XlinkTitle eventValue = unsafeAttribute (map (map (
    \value -> { key: "xlink:title", value: prop' value })) eventValue)
instance Attr LinearGradient_ XlinkTitle (Event.Event  String ) where
  attr XlinkTitle eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "xlink:title", value: prop' value }
instance Attr Mpath_ XlinkTitle  String  where
  attr XlinkTitle value = unsafeAttribute (  
    { key: "xlink:title", value: prop' value  } <$ _)
instance Attr Mpath_ XlinkTitle (Event.Event Unit -> Event.Event  String ) where
  attr XlinkTitle eventValue = unsafeAttribute (map (map (
    \value -> { key: "xlink:title", value: prop' value })) eventValue)
instance Attr Mpath_ XlinkTitle (Event.Event  String ) where
  attr XlinkTitle eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "xlink:title", value: prop' value }
instance Attr Pattern_ XlinkTitle  String  where
  attr XlinkTitle value = unsafeAttribute (  
    { key: "xlink:title", value: prop' value  } <$ _)
instance Attr Pattern_ XlinkTitle (Event.Event Unit -> Event.Event  String ) where
  attr XlinkTitle eventValue = unsafeAttribute (map (map (
    \value -> { key: "xlink:title", value: prop' value })) eventValue)
instance Attr Pattern_ XlinkTitle (Event.Event  String ) where
  attr XlinkTitle eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "xlink:title", value: prop' value }
instance Attr RadialGradient_ XlinkTitle  String  where
  attr XlinkTitle value = unsafeAttribute (  
    { key: "xlink:title", value: prop' value  } <$ _)
instance Attr RadialGradient_ XlinkTitle (Event.Event Unit -> Event.Event  String ) where
  attr XlinkTitle eventValue = unsafeAttribute (map (map (
    \value -> { key: "xlink:title", value: prop' value })) eventValue)
instance Attr RadialGradient_ XlinkTitle (Event.Event  String ) where
  attr XlinkTitle eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "xlink:title", value: prop' value }
instance Attr everything XlinkTitle  Unit  where
  attr XlinkTitle _ = unsafeAttribute (  
    { key: "xlink:title", value: unset'  } <$ _)
instance Attr everything XlinkTitle (Event.Event Unit -> Event.Event  Unit ) where
  attr XlinkTitle eventValue = unsafeAttribute (map (map (
    \_ -> { key: "xlink:title", value: unset' })) eventValue)
instance Attr everything XlinkTitle (Event.Event  Unit ) where
  attr XlinkTitle eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "xlink:title", value: unset' }