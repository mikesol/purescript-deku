module Deku.DOM.Attr.MaskUnits where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Mask (Mask_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data MaskUnits = MaskUnits

instance Attr Mask_ MaskUnits (NonEmpty.NonEmpty Event.Event  String ) where
  attr MaskUnits bothValues = unsafeAttribute $ Both (pure 
    { key: "maskUnits", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "maskUnits", value: prop' value })
instance Attr Mask_ MaskUnits (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr MaskUnits (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "maskUnits", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "maskUnits", value: prop' value })
instance Attr Mask_ MaskUnits  String  where
  attr MaskUnits value = unsafeAttribute $ This $ pure $
    { key: "maskUnits", value: prop' value }
instance Attr Mask_ MaskUnits (Event.Event  String ) where
  attr MaskUnits eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "maskUnits", value: prop' value }

instance Attr Mask_ MaskUnits (ST.ST Global.Global  String ) where
  attr MaskUnits stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "maskUnits", value: prop' value }

instance Attr everything MaskUnits (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr MaskUnits bothValues = unsafeAttribute $ Both (pure 
    { key: "maskUnits", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "maskUnits", value: unset' })
instance Attr everything MaskUnits (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr MaskUnits (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "maskUnits", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "maskUnits", value: unset' })
instance Attr everything MaskUnits  Unit  where
  attr MaskUnits _ = unsafeAttribute $ This $ pure $
    { key: "maskUnits", value: unset' }
instance Attr everything MaskUnits (Event.Event  Unit ) where
  attr MaskUnits eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "maskUnits", value: unset' }

instance Attr everything MaskUnits (ST.ST Global.Global  Unit ) where
  attr MaskUnits stValue = unsafeAttribute $ This $ stValue <#>
    \_ -> { key: "maskUnits", value: unset' }
