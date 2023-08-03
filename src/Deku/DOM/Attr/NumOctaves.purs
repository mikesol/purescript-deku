module Deku.DOM.Attr.NumOctaves where

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

data NumOctaves = NumOctaves

instance Attr FeTurbulence_ NumOctaves (NonEmpty.NonEmpty Event.Event  String ) where
  attr NumOctaves bothValues = unsafeAttribute $ Both (pure 
    { key: "numOctaves", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "numOctaves", value: prop' value })
instance Attr FeTurbulence_ NumOctaves (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr NumOctaves (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "numOctaves", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "numOctaves", value: prop' value })
instance Attr FeTurbulence_ NumOctaves  String  where
  attr NumOctaves value = unsafeAttribute $ This $ pure $
    { key: "numOctaves", value: prop' value }
instance Attr FeTurbulence_ NumOctaves (Event.Event  String ) where
  attr NumOctaves eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "numOctaves", value: prop' value }

instance Attr FeTurbulence_ NumOctaves (ST.ST Global.Global  String ) where
  attr NumOctaves stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "numOctaves", value: prop' value }

instance Attr everything NumOctaves (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr NumOctaves bothValues = unsafeAttribute $ Both (pure 
    { key: "numOctaves", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "numOctaves", value: unset' })
instance Attr everything NumOctaves (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr NumOctaves (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "numOctaves", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "numOctaves", value: unset' })
instance Attr everything NumOctaves  Unit  where
  attr NumOctaves _ = unsafeAttribute $ This $ pure $
    { key: "numOctaves", value: unset' }
instance Attr everything NumOctaves (Event.Event  Unit ) where
  attr NumOctaves eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "numOctaves", value: unset' }

instance Attr everything NumOctaves (ST.ST Global.Global  Unit ) where
  attr NumOctaves stValue = unsafeAttribute $ This $ stValue <#>
    \_ -> { key: "numOctaves", value: unset' }
