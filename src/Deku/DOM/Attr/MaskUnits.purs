module Deku.DOM.Attr.MaskUnits where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Mask (Mask_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data MaskUnits = MaskUnits

instance Attr Mask_ MaskUnits  String  where
  attr MaskUnits value = unsafeAttribute $ Left $  
    { key: "maskUnits", value: prop' value }
instance Attr Mask_ MaskUnits (Event.Event  String ) where
  attr MaskUnits eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "maskUnits", value: prop' value }


instance Attr everything MaskUnits  Unit  where
  attr MaskUnits _ = unsafeAttribute $ Left $  
    { key: "maskUnits", value: unset' }
instance Attr everything MaskUnits (Event.Event  Unit ) where
  attr MaskUnits eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "maskUnits", value: unset' }
