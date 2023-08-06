module Deku.DOM.Attr.XlinkTitle where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

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
  attr XlinkTitle value = unsafeAttribute $ Left $  
    { key: "xlink:title", value: prop' value }
instance Attr AnimateTransform_ XlinkTitle (Event.Event  String ) where
  attr XlinkTitle eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "xlink:title", value: prop' value }


instance Attr FeImage_ XlinkTitle  String  where
  attr XlinkTitle value = unsafeAttribute $ Left $  
    { key: "xlink:title", value: prop' value }
instance Attr FeImage_ XlinkTitle (Event.Event  String ) where
  attr XlinkTitle eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "xlink:title", value: prop' value }


instance Attr Filter_ XlinkTitle  String  where
  attr XlinkTitle value = unsafeAttribute $ Left $  
    { key: "xlink:title", value: prop' value }
instance Attr Filter_ XlinkTitle (Event.Event  String ) where
  attr XlinkTitle eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "xlink:title", value: prop' value }


instance Attr Image_ XlinkTitle  String  where
  attr XlinkTitle value = unsafeAttribute $ Left $  
    { key: "xlink:title", value: prop' value }
instance Attr Image_ XlinkTitle (Event.Event  String ) where
  attr XlinkTitle eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "xlink:title", value: prop' value }


instance Attr LinearGradient_ XlinkTitle  String  where
  attr XlinkTitle value = unsafeAttribute $ Left $  
    { key: "xlink:title", value: prop' value }
instance Attr LinearGradient_ XlinkTitle (Event.Event  String ) where
  attr XlinkTitle eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "xlink:title", value: prop' value }


instance Attr Mpath_ XlinkTitle  String  where
  attr XlinkTitle value = unsafeAttribute $ Left $  
    { key: "xlink:title", value: prop' value }
instance Attr Mpath_ XlinkTitle (Event.Event  String ) where
  attr XlinkTitle eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "xlink:title", value: prop' value }


instance Attr Pattern_ XlinkTitle  String  where
  attr XlinkTitle value = unsafeAttribute $ Left $  
    { key: "xlink:title", value: prop' value }
instance Attr Pattern_ XlinkTitle (Event.Event  String ) where
  attr XlinkTitle eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "xlink:title", value: prop' value }


instance Attr RadialGradient_ XlinkTitle  String  where
  attr XlinkTitle value = unsafeAttribute $ Left $  
    { key: "xlink:title", value: prop' value }
instance Attr RadialGradient_ XlinkTitle (Event.Event  String ) where
  attr XlinkTitle eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "xlink:title", value: prop' value }


instance Attr everything XlinkTitle  Unit  where
  attr XlinkTitle _ = unsafeAttribute $ Left $  
    { key: "xlink:title", value: unset' }
instance Attr everything XlinkTitle (Event.Event  Unit ) where
  attr XlinkTitle eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "xlink:title", value: unset' }
