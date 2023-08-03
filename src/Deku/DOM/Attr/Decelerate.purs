module Deku.DOM.Attr.Decelerate where

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

data Decelerate = Decelerate

instance Attr AnimateTransform_ Decelerate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Decelerate bothValues = unsafeAttribute $ Both (pure 
    { key: "decelerate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "decelerate", value: prop' value })
instance Attr AnimateTransform_ Decelerate (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Decelerate (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "decelerate", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "decelerate", value: prop' value })
instance Attr AnimateTransform_ Decelerate  String  where
  attr Decelerate value = unsafeAttribute $ This $ pure $
    { key: "decelerate", value: prop' value }
instance Attr AnimateTransform_ Decelerate (Event.Event  String ) where
  attr Decelerate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "decelerate", value: prop' value }

instance Attr AnimateTransform_ Decelerate (ST.ST Global.Global  String ) where
  attr Decelerate stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "decelerate", value: prop' value }

instance Attr everything Decelerate (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Decelerate bothValues = unsafeAttribute $ Both (pure 
    { key: "decelerate", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "decelerate", value: unset' })
instance Attr everything Decelerate (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Decelerate (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "decelerate", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "decelerate", value: unset' })
instance Attr everything Decelerate  Unit  where
  attr Decelerate _ = unsafeAttribute $ This $ pure $
    { key: "decelerate", value: unset' }
instance Attr everything Decelerate (Event.Event  Unit ) where
  attr Decelerate eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "decelerate", value: unset' }

instance Attr everything Decelerate (ST.ST Global.Global  Unit ) where
  attr Decelerate stValue = unsafeAttribute $ This $ stValue <#>
    \_ -> { key: "decelerate", value: unset' }
