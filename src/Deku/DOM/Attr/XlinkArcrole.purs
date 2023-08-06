module Deku.DOM.Attr.XlinkArcrole where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.Mpath (Mpath_)
import Deku.DOM.Elt.Image (Image_)
import Deku.DOM.Elt.Filter (Filter_)
import Deku.DOM.Elt.FeImage (FeImage_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data XlinkArcrole = XlinkArcrole

instance Attr AnimateTransform_ XlinkArcrole  String  where
  attr XlinkArcrole value = unsafeAttribute $ Left $  
    { key: "xlink:arcrole", value: prop' value }
instance Attr AnimateTransform_ XlinkArcrole (Event.Event  String ) where
  attr XlinkArcrole eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "xlink:arcrole", value: prop' value }


instance Attr FeImage_ XlinkArcrole  String  where
  attr XlinkArcrole value = unsafeAttribute $ Left $  
    { key: "xlink:arcrole", value: prop' value }
instance Attr FeImage_ XlinkArcrole (Event.Event  String ) where
  attr XlinkArcrole eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "xlink:arcrole", value: prop' value }


instance Attr Filter_ XlinkArcrole  String  where
  attr XlinkArcrole value = unsafeAttribute $ Left $  
    { key: "xlink:arcrole", value: prop' value }
instance Attr Filter_ XlinkArcrole (Event.Event  String ) where
  attr XlinkArcrole eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "xlink:arcrole", value: prop' value }


instance Attr Image_ XlinkArcrole  String  where
  attr XlinkArcrole value = unsafeAttribute $ Left $  
    { key: "xlink:arcrole", value: prop' value }
instance Attr Image_ XlinkArcrole (Event.Event  String ) where
  attr XlinkArcrole eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "xlink:arcrole", value: prop' value }


instance Attr Mpath_ XlinkArcrole  String  where
  attr XlinkArcrole value = unsafeAttribute $ Left $  
    { key: "xlink:arcrole", value: prop' value }
instance Attr Mpath_ XlinkArcrole (Event.Event  String ) where
  attr XlinkArcrole eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "xlink:arcrole", value: prop' value }


instance Attr everything XlinkArcrole  Unit  where
  attr XlinkArcrole _ = unsafeAttribute $ Left $  
    { key: "xlink:arcrole", value: unset' }
instance Attr everything XlinkArcrole (Event.Event  Unit ) where
  attr XlinkArcrole eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "xlink:arcrole", value: unset' }
