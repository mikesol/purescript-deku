module Deku.DOM.Attr.PreserveAlpha where

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

data PreserveAlpha = PreserveAlpha

instance Attr FeConvolveMatrix_ PreserveAlpha (NonEmpty.NonEmpty Event.Event  String ) where
  attr PreserveAlpha bothValues = unsafeAttribute $ Both (pure 
    { key: "preserveAlpha", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "preserveAlpha", value: prop' value })
instance Attr FeConvolveMatrix_ PreserveAlpha (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr PreserveAlpha (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "preserveAlpha", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "preserveAlpha", value: prop' value })
instance Attr FeConvolveMatrix_ PreserveAlpha  String  where
  attr PreserveAlpha value = unsafeAttribute $ This $ pure $
    { key: "preserveAlpha", value: prop' value }
instance Attr FeConvolveMatrix_ PreserveAlpha (Event.Event  String ) where
  attr PreserveAlpha eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "preserveAlpha", value: prop' value }

instance Attr FeConvolveMatrix_ PreserveAlpha (ST.ST Global.Global  String ) where
  attr PreserveAlpha stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "preserveAlpha", value: prop' value }

instance Attr everything PreserveAlpha (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr PreserveAlpha bothValues = unsafeAttribute $ Both (pure 
    { key: "preserveAlpha", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "preserveAlpha", value: unset' })
instance Attr everything PreserveAlpha (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr PreserveAlpha (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "preserveAlpha", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "preserveAlpha", value: unset' })
instance Attr everything PreserveAlpha  Unit  where
  attr PreserveAlpha _ = unsafeAttribute $ This $ pure $
    { key: "preserveAlpha", value: unset' }
instance Attr everything PreserveAlpha (Event.Event  Unit ) where
  attr PreserveAlpha eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "preserveAlpha", value: unset' }

instance Attr everything PreserveAlpha (ST.ST Global.Global  Unit ) where
  attr PreserveAlpha stValue = unsafeAttribute $ This $ stValue <#>
    \_ -> { key: "preserveAlpha", value: unset' }
