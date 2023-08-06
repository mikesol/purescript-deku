module Deku.DOM.Attr.TargetX where

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

data TargetX = TargetX

instance Attr FeConvolveMatrix_ TargetX (NonEmpty.NonEmpty Event.Event  String ) where
  attr TargetX bothValues = unsafeAttribute $ Both (pure 
    { key: "targetX", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "targetX", value: prop' value })
instance Attr FeConvolveMatrix_ TargetX (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr TargetX (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "targetX", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "targetX", value: prop' value })
instance Attr FeConvolveMatrix_ TargetX  String  where
  attr TargetX value = unsafeAttribute $ This $ pure $
    { key: "targetX", value: prop' value }
instance Attr FeConvolveMatrix_ TargetX (Event.Event  String ) where
  attr TargetX eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "targetX", value: prop' value }

instance Attr FeConvolveMatrix_ TargetX (ST.ST Global.Global  String ) where
  attr TargetX iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "targetX", value: prop' value }

instance Attr everything TargetX (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr TargetX bothValues = unsafeAttribute $ Both (pure 
    { key: "targetX", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "targetX", value: unset' })
instance Attr everything TargetX (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr TargetX (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "targetX", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "targetX", value: unset' })
instance Attr everything TargetX  Unit  where
  attr TargetX _ = unsafeAttribute $ This $ { key: "targetX", value: unset' }
instance Attr everything TargetX (Event.Event  Unit ) where
  attr TargetX eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "targetX", value: unset' }

instance Attr everything TargetX (ST.ST Global.Global  Unit ) where
  attr TargetX iValue = unsafeAttribute $ This $ iValue # \_ ->
    { key: "targetX", value: unset' }
