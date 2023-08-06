module Deku.DOM.Attr.Bias where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Bias = Bias

instance Attr FeConvolveMatrix_ Bias (NonEmpty.NonEmpty Event.Event  String ) where
  attr Bias bothValues = unsafeAttribute $ Both (pure 
    { key: "bias", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "bias", value: prop' value })
instance Attr FeConvolveMatrix_ Bias (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Bias (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "bias", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "bias", value: prop' value })
instance Attr FeConvolveMatrix_ Bias  String  where
  attr Bias value = unsafeAttribute $ This $ pure $
    { key: "bias", value: prop' value }
instance Attr FeConvolveMatrix_ Bias (Event.Event  String ) where
  attr Bias eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "bias", value: prop' value }

instance Attr FeConvolveMatrix_ Bias (ST.ST Global.Global  String ) where
  attr Bias iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "bias", value: prop' value }

instance Attr everything Bias (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Bias bothValues = unsafeAttribute $ Both (pure  { key: "bias", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "bias", value: unset' })
instance Attr everything Bias (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Bias (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->   { key: "bias", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "bias", value: unset' })
instance Attr everything Bias  Unit  where
  attr Bias _ = unsafeAttribute $ This $ { key: "bias", value: unset' }
instance Attr everything Bias (Event.Event  Unit ) where
  attr Bias eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "bias", value: unset' }

instance Attr everything Bias (ST.ST Global.Global  Unit ) where
  attr Bias iValue = unsafeAttribute $ This $ iValue # \_ ->
    { key: "bias", value: unset' }
