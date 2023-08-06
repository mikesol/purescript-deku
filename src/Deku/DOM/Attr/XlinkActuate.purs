module Deku.DOM.Attr.XlinkActuate where

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

data XlinkActuate = XlinkActuate

instance Attr AnimateTransform_ XlinkActuate  String  where
  attr XlinkActuate value = unsafeAttribute $ Left $  
    { key: "xlink:actuate", value: prop' value }
instance Attr AnimateTransform_ XlinkActuate (Event.Event  String ) where
  attr XlinkActuate eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "xlink:actuate", value: prop' value }


instance Attr FeImage_ XlinkActuate  String  where
  attr XlinkActuate value = unsafeAttribute $ Left $  
    { key: "xlink:actuate", value: prop' value }
instance Attr FeImage_ XlinkActuate (Event.Event  String ) where
  attr XlinkActuate eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "xlink:actuate", value: prop' value }


instance Attr Filter_ XlinkActuate  String  where
  attr XlinkActuate value = unsafeAttribute $ Left $  
    { key: "xlink:actuate", value: prop' value }
instance Attr Filter_ XlinkActuate (Event.Event  String ) where
  attr XlinkActuate eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "xlink:actuate", value: prop' value }


instance Attr Image_ XlinkActuate  String  where
  attr XlinkActuate value = unsafeAttribute $ Left $  
    { key: "xlink:actuate", value: prop' value }
instance Attr Image_ XlinkActuate (Event.Event  String ) where
  attr XlinkActuate eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "xlink:actuate", value: prop' value }


instance Attr Mpath_ XlinkActuate  String  where
  attr XlinkActuate value = unsafeAttribute $ Left $  
    { key: "xlink:actuate", value: prop' value }
instance Attr Mpath_ XlinkActuate (Event.Event  String ) where
  attr XlinkActuate eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "xlink:actuate", value: prop' value }


instance Attr everything XlinkActuate  Unit  where
  attr XlinkActuate _ = unsafeAttribute $ Left $  
    { key: "xlink:actuate", value: unset' }
instance Attr everything XlinkActuate (Event.Event  Unit ) where
  attr XlinkActuate eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "xlink:actuate", value: unset' }
