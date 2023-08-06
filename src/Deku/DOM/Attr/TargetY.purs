module Deku.DOM.Attr.TargetY where

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

data TargetY = TargetY

instance Attr FeConvolveMatrix_ TargetY (NonEmpty.NonEmpty Event.Event  String ) where
  attr TargetY bothValues = unsafeAttribute $ Both (pure 
    { key: "targetY", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "targetY", value: prop' value })
instance Attr FeConvolveMatrix_ TargetY (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr TargetY (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "targetY", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "targetY", value: prop' value })
instance Attr FeConvolveMatrix_ TargetY  String  where
  attr TargetY value = unsafeAttribute $ This $ pure $
    { key: "targetY", value: prop' value }
instance Attr FeConvolveMatrix_ TargetY (Event.Event  String ) where
  attr TargetY eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "targetY", value: prop' value }

instance Attr FeConvolveMatrix_ TargetY (ST.ST Global.Global  String ) where
  attr TargetY iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "targetY", value: prop' value }

instance Attr everything TargetY (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr TargetY bothValues = unsafeAttribute $ Both (pure 
    { key: "targetY", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "targetY", value: unset' })
instance Attr everything TargetY (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr TargetY (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "targetY", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "targetY", value: unset' })
instance Attr everything TargetY  Unit  where
  attr TargetY _ = unsafeAttribute $ This $ { key: "targetY", value: unset' }
instance Attr everything TargetY (Event.Event  Unit ) where
  attr TargetY eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "targetY", value: unset' }

instance Attr everything TargetY (ST.ST Global.Global  Unit ) where
  attr TargetY iValue = unsafeAttribute $ This $ iValue # \_ ->
    { key: "targetY", value: unset' }
