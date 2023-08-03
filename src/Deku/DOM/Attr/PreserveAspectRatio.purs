module Deku.DOM.Attr.PreserveAspectRatio where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.View (View_)
import Deku.DOM.Elt.Symbol (Symbol_)
import Deku.DOM.Elt.Svg (Svg_)
import Deku.DOM.Elt.Pattern (Pattern_)
import Deku.DOM.Elt.Marker (Marker_)
import Deku.DOM.Elt.Image (Image_)
import Deku.DOM.Elt.FeImage (FeImage_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data PreserveAspectRatio = PreserveAspectRatio

instance Attr FeImage_ PreserveAspectRatio (NonEmpty.NonEmpty Event.Event  String ) where
  attr PreserveAspectRatio bothValues = unsafeAttribute $ Both (pure 
    { key: "preserveAspectRatio", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "preserveAspectRatio", value: prop' value }
    )
instance Attr FeImage_ PreserveAspectRatio (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr PreserveAspectRatio (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "preserveAspectRatio", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "preserveAspectRatio", value: prop' value }
    )
instance Attr FeImage_ PreserveAspectRatio  String  where
  attr PreserveAspectRatio value = unsafeAttribute $ This $ pure $
    { key: "preserveAspectRatio", value: prop' value }
instance Attr FeImage_ PreserveAspectRatio (Event.Event  String ) where
  attr PreserveAspectRatio eventValue = unsafeAttribute $ That $
    eventValue <#> \value -> { key: "preserveAspectRatio", value: prop' value }

instance Attr FeImage_ PreserveAspectRatio (ST.ST Global.Global  String ) where
  attr PreserveAspectRatio stValue = unsafeAttribute $ This $
    stValue <#> \value -> { key: "preserveAspectRatio", value: prop' value }

instance Attr Image_ PreserveAspectRatio (NonEmpty.NonEmpty Event.Event  String ) where
  attr PreserveAspectRatio bothValues = unsafeAttribute $ Both (pure 
    { key: "preserveAspectRatio", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "preserveAspectRatio", value: prop' value }
    )
instance Attr Image_ PreserveAspectRatio (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr PreserveAspectRatio (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "preserveAspectRatio", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "preserveAspectRatio", value: prop' value }
    )
instance Attr Image_ PreserveAspectRatio  String  where
  attr PreserveAspectRatio value = unsafeAttribute $ This $ pure $
    { key: "preserveAspectRatio", value: prop' value }
instance Attr Image_ PreserveAspectRatio (Event.Event  String ) where
  attr PreserveAspectRatio eventValue = unsafeAttribute $ That $
    eventValue <#> \value -> { key: "preserveAspectRatio", value: prop' value }

instance Attr Image_ PreserveAspectRatio (ST.ST Global.Global  String ) where
  attr PreserveAspectRatio stValue = unsafeAttribute $ This $
    stValue <#> \value -> { key: "preserveAspectRatio", value: prop' value }

instance Attr Marker_ PreserveAspectRatio (NonEmpty.NonEmpty Event.Event  String ) where
  attr PreserveAspectRatio bothValues = unsafeAttribute $ Both (pure 
    { key: "preserveAspectRatio", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "preserveAspectRatio", value: prop' value }
    )
instance Attr Marker_ PreserveAspectRatio (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr PreserveAspectRatio (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "preserveAspectRatio", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "preserveAspectRatio", value: prop' value }
    )
instance Attr Marker_ PreserveAspectRatio  String  where
  attr PreserveAspectRatio value = unsafeAttribute $ This $ pure $
    { key: "preserveAspectRatio", value: prop' value }
instance Attr Marker_ PreserveAspectRatio (Event.Event  String ) where
  attr PreserveAspectRatio eventValue = unsafeAttribute $ That $
    eventValue <#> \value -> { key: "preserveAspectRatio", value: prop' value }

instance Attr Marker_ PreserveAspectRatio (ST.ST Global.Global  String ) where
  attr PreserveAspectRatio stValue = unsafeAttribute $ This $
    stValue <#> \value -> { key: "preserveAspectRatio", value: prop' value }

instance Attr Pattern_ PreserveAspectRatio (NonEmpty.NonEmpty Event.Event  String ) where
  attr PreserveAspectRatio bothValues = unsafeAttribute $ Both (pure 
    { key: "preserveAspectRatio", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "preserveAspectRatio", value: prop' value }
    )
instance Attr Pattern_ PreserveAspectRatio (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr PreserveAspectRatio (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "preserveAspectRatio", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "preserveAspectRatio", value: prop' value }
    )
instance Attr Pattern_ PreserveAspectRatio  String  where
  attr PreserveAspectRatio value = unsafeAttribute $ This $ pure $
    { key: "preserveAspectRatio", value: prop' value }
instance Attr Pattern_ PreserveAspectRatio (Event.Event  String ) where
  attr PreserveAspectRatio eventValue = unsafeAttribute $ That $
    eventValue <#> \value -> { key: "preserveAspectRatio", value: prop' value }

instance Attr Pattern_ PreserveAspectRatio (ST.ST Global.Global  String ) where
  attr PreserveAspectRatio stValue = unsafeAttribute $ This $
    stValue <#> \value -> { key: "preserveAspectRatio", value: prop' value }

instance Attr Svg_ PreserveAspectRatio (NonEmpty.NonEmpty Event.Event  String ) where
  attr PreserveAspectRatio bothValues = unsafeAttribute $ Both (pure 
    { key: "preserveAspectRatio", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "preserveAspectRatio", value: prop' value }
    )
instance Attr Svg_ PreserveAspectRatio (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr PreserveAspectRatio (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "preserveAspectRatio", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "preserveAspectRatio", value: prop' value }
    )
instance Attr Svg_ PreserveAspectRatio  String  where
  attr PreserveAspectRatio value = unsafeAttribute $ This $ pure $
    { key: "preserveAspectRatio", value: prop' value }
instance Attr Svg_ PreserveAspectRatio (Event.Event  String ) where
  attr PreserveAspectRatio eventValue = unsafeAttribute $ That $
    eventValue <#> \value -> { key: "preserveAspectRatio", value: prop' value }

instance Attr Svg_ PreserveAspectRatio (ST.ST Global.Global  String ) where
  attr PreserveAspectRatio stValue = unsafeAttribute $ This $
    stValue <#> \value -> { key: "preserveAspectRatio", value: prop' value }

instance Attr Symbol_ PreserveAspectRatio (NonEmpty.NonEmpty Event.Event  String ) where
  attr PreserveAspectRatio bothValues = unsafeAttribute $ Both (pure 
    { key: "preserveAspectRatio", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "preserveAspectRatio", value: prop' value }
    )
instance Attr Symbol_ PreserveAspectRatio (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr PreserveAspectRatio (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "preserveAspectRatio", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "preserveAspectRatio", value: prop' value }
    )
instance Attr Symbol_ PreserveAspectRatio  String  where
  attr PreserveAspectRatio value = unsafeAttribute $ This $ pure $
    { key: "preserveAspectRatio", value: prop' value }
instance Attr Symbol_ PreserveAspectRatio (Event.Event  String ) where
  attr PreserveAspectRatio eventValue = unsafeAttribute $ That $
    eventValue <#> \value -> { key: "preserveAspectRatio", value: prop' value }

instance Attr Symbol_ PreserveAspectRatio (ST.ST Global.Global  String ) where
  attr PreserveAspectRatio stValue = unsafeAttribute $ This $
    stValue <#> \value -> { key: "preserveAspectRatio", value: prop' value }

instance Attr View_ PreserveAspectRatio (NonEmpty.NonEmpty Event.Event  String ) where
  attr PreserveAspectRatio bothValues = unsafeAttribute $ Both (pure 
    { key: "preserveAspectRatio", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "preserveAspectRatio", value: prop' value }
    )
instance Attr View_ PreserveAspectRatio (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr PreserveAspectRatio (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "preserveAspectRatio", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "preserveAspectRatio", value: prop' value }
    )
instance Attr View_ PreserveAspectRatio  String  where
  attr PreserveAspectRatio value = unsafeAttribute $ This $ pure $
    { key: "preserveAspectRatio", value: prop' value }
instance Attr View_ PreserveAspectRatio (Event.Event  String ) where
  attr PreserveAspectRatio eventValue = unsafeAttribute $ That $
    eventValue <#> \value -> { key: "preserveAspectRatio", value: prop' value }

instance Attr View_ PreserveAspectRatio (ST.ST Global.Global  String ) where
  attr PreserveAspectRatio stValue = unsafeAttribute $ This $
    stValue <#> \value -> { key: "preserveAspectRatio", value: prop' value }

instance Attr everything PreserveAspectRatio (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr PreserveAspectRatio bothValues = unsafeAttribute $ Both (pure 
    { key: "preserveAspectRatio", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "preserveAspectRatio", value: unset' })
instance Attr everything PreserveAspectRatio (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr PreserveAspectRatio (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "preserveAspectRatio", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "preserveAspectRatio", value: unset' })
instance Attr everything PreserveAspectRatio  Unit  where
  attr PreserveAspectRatio _ = unsafeAttribute $ This $ pure $
    { key: "preserveAspectRatio", value: unset' }
instance Attr everything PreserveAspectRatio (Event.Event  Unit ) where
  attr PreserveAspectRatio eventValue = unsafeAttribute $ That $
    eventValue <#> \_ -> { key: "preserveAspectRatio", value: unset' }

instance Attr everything PreserveAspectRatio (ST.ST Global.Global  Unit ) where
  attr PreserveAspectRatio stValue = unsafeAttribute $ This $
    stValue <#> \_ -> { key: "preserveAspectRatio", value: unset' }
