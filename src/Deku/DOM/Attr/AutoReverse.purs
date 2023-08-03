module Deku.DOM.Attr.AutoReverse where

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

data AutoReverse = AutoReverse

instance Attr AnimateTransform_ AutoReverse (NonEmpty.NonEmpty Event.Event  String ) where
  attr AutoReverse bothValues = unsafeAttribute $ Both (pure 
    { key: "autoReverse", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autoReverse", value: prop' value })
instance Attr AnimateTransform_ AutoReverse (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr AutoReverse (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autoReverse", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autoReverse", value: prop' value })
instance Attr AnimateTransform_ AutoReverse  String  where
  attr AutoReverse value = unsafeAttribute $ This $ pure $
    { key: "autoReverse", value: prop' value }
instance Attr AnimateTransform_ AutoReverse (Event.Event  String ) where
  attr AutoReverse eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autoReverse", value: prop' value }

instance Attr AnimateTransform_ AutoReverse (ST.ST Global.Global  String ) where
  attr AutoReverse stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autoReverse", value: prop' value }

instance Attr everything AutoReverse (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr AutoReverse bothValues = unsafeAttribute $ Both (pure 
    { key: "autoReverse", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "autoReverse", value: unset' })
instance Attr everything AutoReverse (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr AutoReverse (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "autoReverse", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "autoReverse", value: unset' })
instance Attr everything AutoReverse  Unit  where
  attr AutoReverse _ = unsafeAttribute $ This $ pure $
    { key: "autoReverse", value: unset' }
instance Attr everything AutoReverse (Event.Event  Unit ) where
  attr AutoReverse eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "autoReverse", value: unset' }

instance Attr everything AutoReverse (ST.ST Global.Global  Unit ) where
  attr AutoReverse stValue = unsafeAttribute $ This $ stValue <#>
    \_ -> { key: "autoReverse", value: unset' }
