module Deku.DOM.Attr.BaseFrequency where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeTurbulence (FeTurbulence_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data BaseFrequency = BaseFrequency

instance Attr FeTurbulence_ BaseFrequency (NonEmpty.NonEmpty Event.Event  String ) where
  attr BaseFrequency bothValues = unsafeAttribute $ Both (pure 
    { key: "baseFrequency", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "baseFrequency", value: prop' value })
instance Attr FeTurbulence_ BaseFrequency (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr BaseFrequency (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "baseFrequency", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "baseFrequency", value: prop' value })
instance Attr FeTurbulence_ BaseFrequency  String  where
  attr BaseFrequency value = unsafeAttribute $ This $ pure $
    { key: "baseFrequency", value: prop' value }
instance Attr FeTurbulence_ BaseFrequency (Event.Event  String ) where
  attr BaseFrequency eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "baseFrequency", value: prop' value }

instance Attr FeTurbulence_ BaseFrequency (ST.ST Global.Global  String ) where
  attr BaseFrequency stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "baseFrequency", value: prop' value }

instance Attr everything BaseFrequency (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr BaseFrequency bothValues = unsafeAttribute $ Both (pure 
    { key: "baseFrequency", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "baseFrequency", value: unset' })
instance Attr everything BaseFrequency (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr BaseFrequency (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "baseFrequency", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "baseFrequency", value: unset' })
instance Attr everything BaseFrequency  Unit  where
  attr BaseFrequency _ = unsafeAttribute $ This $ pure $
    { key: "baseFrequency", value: unset' }
instance Attr everything BaseFrequency (Event.Event  Unit ) where
  attr BaseFrequency eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "baseFrequency", value: unset' }

instance Attr everything BaseFrequency (ST.ST Global.Global  Unit ) where
  attr BaseFrequency stValue = unsafeAttribute $ This $ stValue <#>
    \_ -> { key: "baseFrequency", value: unset' }
