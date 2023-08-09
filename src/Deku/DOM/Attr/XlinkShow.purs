module Deku.DOM.Attr.XlinkShow where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Mpath (Mpath_)
import Deku.DOM.Elt.Image (Image_)
import Deku.DOM.Elt.Filter (Filter_)
import Deku.DOM.Elt.FeImage (FeImage_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data XlinkShow = XlinkShow
instance Attr AnimateTransform_ XlinkShow  String  where
  attr XlinkShow value = unsafeAttribute (  
    { key: "xlink:show", value: prop' value  } <$ _)
instance Attr AnimateTransform_ XlinkShow (Event.Event Unit -> Event.Event  String ) where
  attr XlinkShow eventValue = unsafeAttribute (map (map (
    \value -> { key: "xlink:show", value: prop' value })) eventValue)
instance Attr AnimateTransform_ XlinkShow (Event.Event  String ) where
  attr XlinkShow eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "xlink:show", value: prop' value }
instance Attr FeImage_ XlinkShow  String  where
  attr XlinkShow value = unsafeAttribute (  
    { key: "xlink:show", value: prop' value  } <$ _)
instance Attr FeImage_ XlinkShow (Event.Event Unit -> Event.Event  String ) where
  attr XlinkShow eventValue = unsafeAttribute (map (map (
    \value -> { key: "xlink:show", value: prop' value })) eventValue)
instance Attr FeImage_ XlinkShow (Event.Event  String ) where
  attr XlinkShow eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "xlink:show", value: prop' value }
instance Attr Filter_ XlinkShow  String  where
  attr XlinkShow value = unsafeAttribute (  
    { key: "xlink:show", value: prop' value  } <$ _)
instance Attr Filter_ XlinkShow (Event.Event Unit -> Event.Event  String ) where
  attr XlinkShow eventValue = unsafeAttribute (map (map (
    \value -> { key: "xlink:show", value: prop' value })) eventValue)
instance Attr Filter_ XlinkShow (Event.Event  String ) where
  attr XlinkShow eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "xlink:show", value: prop' value }
instance Attr Image_ XlinkShow  String  where
  attr XlinkShow value = unsafeAttribute (  
    { key: "xlink:show", value: prop' value  } <$ _)
instance Attr Image_ XlinkShow (Event.Event Unit -> Event.Event  String ) where
  attr XlinkShow eventValue = unsafeAttribute (map (map (
    \value -> { key: "xlink:show", value: prop' value })) eventValue)
instance Attr Image_ XlinkShow (Event.Event  String ) where
  attr XlinkShow eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "xlink:show", value: prop' value }
instance Attr Mpath_ XlinkShow  String  where
  attr XlinkShow value = unsafeAttribute (  
    { key: "xlink:show", value: prop' value  } <$ _)
instance Attr Mpath_ XlinkShow (Event.Event Unit -> Event.Event  String ) where
  attr XlinkShow eventValue = unsafeAttribute (map (map (
    \value -> { key: "xlink:show", value: prop' value })) eventValue)
instance Attr Mpath_ XlinkShow (Event.Event  String ) where
  attr XlinkShow eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "xlink:show", value: prop' value }
instance Attr everything XlinkShow  Unit  where
  attr XlinkShow _ = unsafeAttribute (  
    { key: "xlink:show", value: unset'  } <$ _)
instance Attr everything XlinkShow (Event.Event Unit -> Event.Event  Unit ) where
  attr XlinkShow eventValue = unsafeAttribute (map (map (
    \_ -> { key: "xlink:show", value: unset' })) eventValue)
instance Attr everything XlinkShow (Event.Event  Unit ) where
  attr XlinkShow eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "xlink:show", value: unset' }