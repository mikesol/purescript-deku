module Deku.DOM.Attr.Elevation where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeDistantLight (FeDistantLight_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Elevation = Elevation

instance Attr FeDistantLight_ Elevation (NonEmpty.NonEmpty Event.Event  String ) where
  attr Elevation bothValues = unsafeAttribute $ Both (pure 
    { key: "elevation", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "elevation", value: prop' value })
instance Attr FeDistantLight_ Elevation (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Elevation (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "elevation", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "elevation", value: prop' value })
instance Attr FeDistantLight_ Elevation  String  where
  attr Elevation value = unsafeAttribute $ This $ pure $
    { key: "elevation", value: prop' value }
instance Attr FeDistantLight_ Elevation (Event.Event  String ) where
  attr Elevation eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "elevation", value: prop' value }

instance Attr FeDistantLight_ Elevation (ST.ST Global.Global  String ) where
  attr Elevation iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "elevation", value: prop' value }

instance Attr everything Elevation (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Elevation bothValues = unsafeAttribute $ Both (pure 
    { key: "elevation", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "elevation", value: unset' })
instance Attr everything Elevation (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Elevation (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "elevation", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "elevation", value: unset' })
instance Attr everything Elevation  Unit  where
  attr Elevation _ = unsafeAttribute $ This $ pure $
    { key: "elevation", value: unset' }
instance Attr everything Elevation (Event.Event  Unit ) where
  attr Elevation eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "elevation", value: unset' }

instance Attr everything Elevation (ST.ST Global.Global  Unit ) where
  attr Elevation iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "elevation", value: unset' }
