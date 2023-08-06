module Deku.DOM.Attr.EdgeMode where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeGaussianBlur (FeGaussianBlur_)
import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data EdgeMode = EdgeMode

instance Attr FeConvolveMatrix_ EdgeMode (NonEmpty.NonEmpty Event.Event  String ) where
  attr EdgeMode bothValues = unsafeAttribute $ Both (pure 
    { key: "edgeMode", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "edgeMode", value: prop' value })
instance Attr FeConvolveMatrix_ EdgeMode (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr EdgeMode (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "edgeMode", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "edgeMode", value: prop' value })
instance Attr FeConvolveMatrix_ EdgeMode  String  where
  attr EdgeMode value = unsafeAttribute $ This $ pure $
    { key: "edgeMode", value: prop' value }
instance Attr FeConvolveMatrix_ EdgeMode (Event.Event  String ) where
  attr EdgeMode eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "edgeMode", value: prop' value }

instance Attr FeConvolveMatrix_ EdgeMode (ST.ST Global.Global  String ) where
  attr EdgeMode iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "edgeMode", value: prop' value }

instance Attr FeGaussianBlur_ EdgeMode (NonEmpty.NonEmpty Event.Event  String ) where
  attr EdgeMode bothValues = unsafeAttribute $ Both (pure 
    { key: "edgeMode", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "edgeMode", value: prop' value })
instance Attr FeGaussianBlur_ EdgeMode (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr EdgeMode (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "edgeMode", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "edgeMode", value: prop' value })
instance Attr FeGaussianBlur_ EdgeMode  String  where
  attr EdgeMode value = unsafeAttribute $ This $ pure $
    { key: "edgeMode", value: prop' value }
instance Attr FeGaussianBlur_ EdgeMode (Event.Event  String ) where
  attr EdgeMode eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "edgeMode", value: prop' value }

instance Attr FeGaussianBlur_ EdgeMode (ST.ST Global.Global  String ) where
  attr EdgeMode iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "edgeMode", value: prop' value }

instance Attr everything EdgeMode (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr EdgeMode bothValues = unsafeAttribute $ Both (pure 
    { key: "edgeMode", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "edgeMode", value: unset' })
instance Attr everything EdgeMode (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr EdgeMode (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "edgeMode", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "edgeMode", value: unset' })
instance Attr everything EdgeMode  Unit  where
  attr EdgeMode _ = unsafeAttribute $ This $ pure $
    { key: "edgeMode", value: unset' }
instance Attr everything EdgeMode (Event.Event  Unit ) where
  attr EdgeMode eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "edgeMode", value: unset' }

instance Attr everything EdgeMode (ST.ST Global.Global  Unit ) where
  attr EdgeMode iValue = unsafeAttribute $ This $ iValue # \_ ->
    { key: "edgeMode", value: unset' }
