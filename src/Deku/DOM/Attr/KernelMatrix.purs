module Deku.DOM.Attr.KernelMatrix where

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

data KernelMatrix = KernelMatrix

instance Attr FeConvolveMatrix_ KernelMatrix (NonEmpty.NonEmpty Event.Event  String ) where
  attr KernelMatrix bothValues = unsafeAttribute $ Both (pure 
    { key: "kernelMatrix", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "kernelMatrix", value: prop' value })
instance Attr FeConvolveMatrix_ KernelMatrix (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr KernelMatrix (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "kernelMatrix", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "kernelMatrix", value: prop' value })
instance Attr FeConvolveMatrix_ KernelMatrix  String  where
  attr KernelMatrix value = unsafeAttribute $ This $ pure $
    { key: "kernelMatrix", value: prop' value }
instance Attr FeConvolveMatrix_ KernelMatrix (Event.Event  String ) where
  attr KernelMatrix eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "kernelMatrix", value: prop' value }

instance Attr FeConvolveMatrix_ KernelMatrix (ST.ST Global.Global  String ) where
  attr KernelMatrix stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "kernelMatrix", value: prop' value }

instance Attr everything KernelMatrix (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr KernelMatrix bothValues = unsafeAttribute $ Both (pure 
    { key: "kernelMatrix", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "kernelMatrix", value: unset' })
instance Attr everything KernelMatrix (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr KernelMatrix (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "kernelMatrix", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "kernelMatrix", value: unset' })
instance Attr everything KernelMatrix  Unit  where
  attr KernelMatrix _ = unsafeAttribute $ This $ pure $
    { key: "kernelMatrix", value: unset' }
instance Attr everything KernelMatrix (Event.Event  Unit ) where
  attr KernelMatrix eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "kernelMatrix", value: unset' }

instance Attr everything KernelMatrix (ST.ST Global.Global  Unit ) where
  attr KernelMatrix stValue = unsafeAttribute $ This $ stValue <#>
    \_ -> { key: "kernelMatrix", value: unset' }
