module Deku.DOM.Attr.KernelMatrix where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data KernelMatrix = KernelMatrix

instance Attr FeConvolveMatrix_ KernelMatrix  String  where
  attr KernelMatrix value = unsafeAttribute $ Left $  
    { key: "kernelMatrix", value: prop' value }
instance Attr FeConvolveMatrix_ KernelMatrix (Event.Event  String ) where
  attr KernelMatrix eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "kernelMatrix", value: prop' value }


instance Attr everything KernelMatrix  Unit  where
  attr KernelMatrix _ = unsafeAttribute $ Left $  
    { key: "kernelMatrix", value: unset' }
instance Attr everything KernelMatrix (Event.Event  Unit ) where
  attr KernelMatrix eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "kernelMatrix", value: unset' }
