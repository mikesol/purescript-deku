module Deku.DOM.Attr.Radius where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeMorphology (FeMorphology_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Radius = Radius

instance Attr FeMorphology_ Radius (NonEmpty.NonEmpty Event.Event  String ) where
  attr Radius bothValues = unsafeAttribute $ Both (pure 
    { key: "radius", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "radius", value: prop' value })
instance Attr FeMorphology_ Radius (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Radius (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "radius", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "radius", value: prop' value })
instance Attr FeMorphology_ Radius  String  where
  attr Radius value = unsafeAttribute $ This $ pure $
    { key: "radius", value: prop' value }
instance Attr FeMorphology_ Radius (Event.Event  String ) where
  attr Radius eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "radius", value: prop' value }

instance Attr FeMorphology_ Radius (ST.ST Global.Global  String ) where
  attr Radius iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "radius", value: prop' value }

instance Attr everything Radius (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Radius bothValues = unsafeAttribute $ Both (pure 
    { key: "radius", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "radius", value: unset' })
instance Attr everything Radius (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Radius (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "radius", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "radius", value: unset' })
instance Attr everything Radius  Unit  where
  attr Radius _ = unsafeAttribute $ This $ { key: "radius", value: unset' }
instance Attr everything Radius (Event.Event  Unit ) where
  attr Radius eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "radius", value: unset' }

instance Attr everything Radius (ST.ST Global.Global  Unit ) where
  attr Radius iValue = unsafeAttribute $ This $ iValue # \_ ->
    { key: "radius", value: unset' }
