module Deku.DOM.Attr.XlinkType where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.Mpath (Mpath_)
import Deku.DOM.Elt.Image (Image_)
import Deku.DOM.Elt.Filter (Filter_)
import Deku.DOM.Elt.FeImage (FeImage_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data XlinkType = XlinkType

instance Attr AnimateTransform_ XlinkType  String  where
  attr XlinkType value = unsafeAttribute $ Left $  
    { key: "xlink:type", value: prop' value }
instance Attr AnimateTransform_ XlinkType (Event.Event  String ) where
  attr XlinkType eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "xlink:type", value: prop' value }


instance Attr FeImage_ XlinkType  String  where
  attr XlinkType value = unsafeAttribute $ Left $  
    { key: "xlink:type", value: prop' value }
instance Attr FeImage_ XlinkType (Event.Event  String ) where
  attr XlinkType eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "xlink:type", value: prop' value }


instance Attr Filter_ XlinkType  String  where
  attr XlinkType value = unsafeAttribute $ Left $  
    { key: "xlink:type", value: prop' value }
instance Attr Filter_ XlinkType (Event.Event  String ) where
  attr XlinkType eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "xlink:type", value: prop' value }


instance Attr Image_ XlinkType  String  where
  attr XlinkType value = unsafeAttribute $ Left $  
    { key: "xlink:type", value: prop' value }
instance Attr Image_ XlinkType (Event.Event  String ) where
  attr XlinkType eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "xlink:type", value: prop' value }


instance Attr Mpath_ XlinkType  String  where
  attr XlinkType value = unsafeAttribute $ Left $  
    { key: "xlink:type", value: prop' value }
instance Attr Mpath_ XlinkType (Event.Event  String ) where
  attr XlinkType eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "xlink:type", value: prop' value }


instance Attr everything XlinkType  Unit  where
  attr XlinkType _ = unsafeAttribute $ Left $  
    { key: "xlink:type", value: unset' }
instance Attr everything XlinkType (Event.Event  Unit ) where
  attr XlinkType eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "xlink:type", value: unset' }
