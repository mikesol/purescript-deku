module Deku.DOM.Attr.XlinkActuate where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Mpath (Mpath_)
import Deku.DOM.Elt.Image (Image_)
import Deku.DOM.Elt.Filter (Filter_)
import Deku.DOM.Elt.FeImage (FeImage_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data XlinkActuate = XlinkActuate

instance Attr AnimateTransform_ XlinkActuate (NonEmpty.NonEmpty Event.Event  String ) where
  attr XlinkActuate bothValues = unsafeAttribute $ Both (pure 
    { key: "xlink:actuate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xlink:actuate", value: prop' value })
instance Attr AnimateTransform_ XlinkActuate (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XlinkActuate (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "xlink:actuate", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xlink:actuate", value: prop' value })
instance Attr AnimateTransform_ XlinkActuate  String  where
  attr XlinkActuate value = unsafeAttribute $ This $ pure $
    { key: "xlink:actuate", value: prop' value }
instance Attr AnimateTransform_ XlinkActuate (Event.Event  String ) where
  attr XlinkActuate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xlink:actuate", value: prop' value }

instance Attr AnimateTransform_ XlinkActuate (ST.ST Global.Global  String ) where
  attr XlinkActuate iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "xlink:actuate", value: prop' value }

instance Attr FeImage_ XlinkActuate (NonEmpty.NonEmpty Event.Event  String ) where
  attr XlinkActuate bothValues = unsafeAttribute $ Both (pure 
    { key: "xlink:actuate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xlink:actuate", value: prop' value })
instance Attr FeImage_ XlinkActuate (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XlinkActuate (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "xlink:actuate", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xlink:actuate", value: prop' value })
instance Attr FeImage_ XlinkActuate  String  where
  attr XlinkActuate value = unsafeAttribute $ This $ pure $
    { key: "xlink:actuate", value: prop' value }
instance Attr FeImage_ XlinkActuate (Event.Event  String ) where
  attr XlinkActuate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xlink:actuate", value: prop' value }

instance Attr FeImage_ XlinkActuate (ST.ST Global.Global  String ) where
  attr XlinkActuate iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "xlink:actuate", value: prop' value }

instance Attr Filter_ XlinkActuate (NonEmpty.NonEmpty Event.Event  String ) where
  attr XlinkActuate bothValues = unsafeAttribute $ Both (pure 
    { key: "xlink:actuate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xlink:actuate", value: prop' value })
instance Attr Filter_ XlinkActuate (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XlinkActuate (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "xlink:actuate", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xlink:actuate", value: prop' value })
instance Attr Filter_ XlinkActuate  String  where
  attr XlinkActuate value = unsafeAttribute $ This $ pure $
    { key: "xlink:actuate", value: prop' value }
instance Attr Filter_ XlinkActuate (Event.Event  String ) where
  attr XlinkActuate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xlink:actuate", value: prop' value }

instance Attr Filter_ XlinkActuate (ST.ST Global.Global  String ) where
  attr XlinkActuate iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "xlink:actuate", value: prop' value }

instance Attr Image_ XlinkActuate (NonEmpty.NonEmpty Event.Event  String ) where
  attr XlinkActuate bothValues = unsafeAttribute $ Both (pure 
    { key: "xlink:actuate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xlink:actuate", value: prop' value })
instance Attr Image_ XlinkActuate (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XlinkActuate (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "xlink:actuate", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xlink:actuate", value: prop' value })
instance Attr Image_ XlinkActuate  String  where
  attr XlinkActuate value = unsafeAttribute $ This $ pure $
    { key: "xlink:actuate", value: prop' value }
instance Attr Image_ XlinkActuate (Event.Event  String ) where
  attr XlinkActuate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xlink:actuate", value: prop' value }

instance Attr Image_ XlinkActuate (ST.ST Global.Global  String ) where
  attr XlinkActuate iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "xlink:actuate", value: prop' value }

instance Attr Mpath_ XlinkActuate (NonEmpty.NonEmpty Event.Event  String ) where
  attr XlinkActuate bothValues = unsafeAttribute $ Both (pure 
    { key: "xlink:actuate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xlink:actuate", value: prop' value })
instance Attr Mpath_ XlinkActuate (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XlinkActuate (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "xlink:actuate", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xlink:actuate", value: prop' value })
instance Attr Mpath_ XlinkActuate  String  where
  attr XlinkActuate value = unsafeAttribute $ This $ pure $
    { key: "xlink:actuate", value: prop' value }
instance Attr Mpath_ XlinkActuate (Event.Event  String ) where
  attr XlinkActuate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xlink:actuate", value: prop' value }

instance Attr Mpath_ XlinkActuate (ST.ST Global.Global  String ) where
  attr XlinkActuate iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "xlink:actuate", value: prop' value }

instance Attr everything XlinkActuate (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr XlinkActuate bothValues = unsafeAttribute $ Both (pure 
    { key: "xlink:actuate", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "xlink:actuate", value: unset' })
instance Attr everything XlinkActuate (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr XlinkActuate (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "xlink:actuate", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "xlink:actuate", value: unset' })
instance Attr everything XlinkActuate  Unit  where
  attr XlinkActuate _ = unsafeAttribute $ This $ pure $
    { key: "xlink:actuate", value: unset' }
instance Attr everything XlinkActuate (Event.Event  Unit ) where
  attr XlinkActuate eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "xlink:actuate", value: unset' }

instance Attr everything XlinkActuate (ST.ST Global.Global  Unit ) where
  attr XlinkActuate iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "xlink:actuate", value: unset' }
