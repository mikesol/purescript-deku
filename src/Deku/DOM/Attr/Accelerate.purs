module Deku.DOM.Attr.Accelerate where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Accelerate = Accelerate

instance Attr AnimateTransform_ Accelerate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accelerate bothValues = unsafeAttribute $ Both (pure 
    { key: "accelerate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "accelerate", value: prop' value })
instance Attr AnimateTransform_ Accelerate (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Accelerate (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "accelerate", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "accelerate", value: prop' value })
instance Attr AnimateTransform_ Accelerate  String  where
  attr Accelerate value = unsafeAttribute $ This $ pure $
    { key: "accelerate", value: prop' value }
instance Attr AnimateTransform_ Accelerate (Event.Event  String ) where
  attr Accelerate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accelerate", value: prop' value }

instance Attr AnimateTransform_ Accelerate (ST.ST Global.Global  String ) where
  attr Accelerate iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "accelerate", value: prop' value }

instance Attr everything Accelerate (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Accelerate bothValues = unsafeAttribute $ Both (pure 
    { key: "accelerate", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "accelerate", value: unset' })
instance Attr everything Accelerate (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Accelerate (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "accelerate", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "accelerate", value: unset' })
instance Attr everything Accelerate  Unit  where
  attr Accelerate _ = unsafeAttribute $ This $ pure $
    { key: "accelerate", value: unset' }
instance Attr everything Accelerate (Event.Event  Unit ) where
  attr Accelerate eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "accelerate", value: unset' }

instance Attr everything Accelerate (ST.ST Global.Global  Unit ) where
  attr Accelerate iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "accelerate", value: unset' }
