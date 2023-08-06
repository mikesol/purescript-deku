module Deku.DOM.Attr.StitchTiles where

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

data StitchTiles = StitchTiles

instance Attr FeTurbulence_ StitchTiles (NonEmpty.NonEmpty Event.Event  String ) where
  attr StitchTiles bothValues = unsafeAttribute $ Both (pure 
    { key: "stitchTiles", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stitchTiles", value: prop' value })
instance Attr FeTurbulence_ StitchTiles (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StitchTiles (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stitchTiles", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stitchTiles", value: prop' value })
instance Attr FeTurbulence_ StitchTiles  String  where
  attr StitchTiles value = unsafeAttribute $ This $ pure $
    { key: "stitchTiles", value: prop' value }
instance Attr FeTurbulence_ StitchTiles (Event.Event  String ) where
  attr StitchTiles eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stitchTiles", value: prop' value }

instance Attr FeTurbulence_ StitchTiles (ST.ST Global.Global  String ) where
  attr StitchTiles iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stitchTiles", value: prop' value }

instance Attr everything StitchTiles (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr StitchTiles bothValues = unsafeAttribute $ Both (pure 
    { key: "stitchTiles", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "stitchTiles", value: unset' })
instance Attr everything StitchTiles (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr StitchTiles (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "stitchTiles", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "stitchTiles", value: unset' })
instance Attr everything StitchTiles  Unit  where
  attr StitchTiles _ = unsafeAttribute $ This $ pure $
    { key: "stitchTiles", value: unset' }
instance Attr everything StitchTiles (Event.Event  Unit ) where
  attr StitchTiles eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "stitchTiles", value: unset' }

instance Attr everything StitchTiles (ST.ST Global.Global  Unit ) where
  attr StitchTiles iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "stitchTiles", value: unset' }
