module Deku.DOM.Attr.XlinkRole where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Mpath (Mpath_)
import Deku.DOM.Elt.Image (Image_)
import Deku.DOM.Elt.Filter (Filter_)
import Deku.DOM.Elt.FeImage (FeImage_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data XlinkRole = XlinkRole

instance Attr AnimateTransform_ XlinkRole  String  where
  attr XlinkRole value = unsafeAttribute $ Left $  
    { key: "xlink:role", value: prop' value }
instance Attr AnimateTransform_ XlinkRole (Event.Event  String ) where
  attr XlinkRole eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "xlink:role", value: prop' value }


instance Attr FeImage_ XlinkRole  String  where
  attr XlinkRole value = unsafeAttribute $ Left $  
    { key: "xlink:role", value: prop' value }
instance Attr FeImage_ XlinkRole (Event.Event  String ) where
  attr XlinkRole eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "xlink:role", value: prop' value }


instance Attr Filter_ XlinkRole  String  where
  attr XlinkRole value = unsafeAttribute $ Left $  
    { key: "xlink:role", value: prop' value }
instance Attr Filter_ XlinkRole (Event.Event  String ) where
  attr XlinkRole eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "xlink:role", value: prop' value }


instance Attr Image_ XlinkRole  String  where
  attr XlinkRole value = unsafeAttribute $ Left $  
    { key: "xlink:role", value: prop' value }
instance Attr Image_ XlinkRole (Event.Event  String ) where
  attr XlinkRole eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "xlink:role", value: prop' value }


instance Attr Mpath_ XlinkRole  String  where
  attr XlinkRole value = unsafeAttribute $ Left $  
    { key: "xlink:role", value: prop' value }
instance Attr Mpath_ XlinkRole (Event.Event  String ) where
  attr XlinkRole eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "xlink:role", value: prop' value }


instance Attr everything XlinkRole  Unit  where
  attr XlinkRole _ = unsafeAttribute $ Left $  
    { key: "xlink:role", value: unset' }
instance Attr everything XlinkRole (Event.Event  Unit ) where
  attr XlinkRole eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "xlink:role", value: unset' }
