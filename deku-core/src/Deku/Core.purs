-- | This module contains the low-level functionality of Deku, including
-- | the primitive `Nut` type, which is the type of a Deku application.
-- | In general, this module is not intended to be used directly, with the
-- | exception of the `Nut` type signature and, when needed, the `Nut`
-- | type signature (for which `Nut` is an alias).
module Deku.Core
  ( Attribute
  , Attribute'
  , Cb(..)
  , Key(..)
  , Value(..)
  , Namespace(..)
  , Tag(..)

  , MakeElement
  , SetCb
  , SetProp
  , UnsetAttribute
  , AttachElement
  , RemoveElement
  , MakeText
  , SetText
  , AttachText
  , RemoveText
  , BeamRegion
  , MakeTemplate
  , CloneElement
  , CloneTemplate
  , TemplateContent

  , DOMInterpret(..)
  , DekuDynamic(..)
  , Hook
  , Hook'
  , Nut(..)
  , PSR(..)
  , attributeAtYourOwnRisk
  , callbackWithCaution
  , cb
  , cb'

  , PursXable(..)
  , class PursxToElement
  , pursxToElement

  , elementify
  , fixed
  -- , portal
  , prop'
  , pump
  , text
  , text_
  , unsafeAttribute
  , unsafeUnAttribute
  , unset'
  , useDeflect

  , DynOptions
  , dynOptions
  , useDyn
  , useDynAtBeginning
  , useDynAtBeginningWith
  , useDynAtEnd
  , useDynAtEndWith
  , useDynWith

  , useHot
  , useHotRant
  , useMailboxed
  , useMailboxedS
  , useRant
  , useRant'
  , useRef
  , useRefST
  , useSplit
  , useState
  , useState'
  , useStateTagged'
  , withUnsub
  , xdata
  )
  where

import Prelude

import Control.Alt ((<|>))
import Control.Monad.ST.Class (liftST)
import Control.Monad.ST.Global (Global)
import Control.Monad.ST.Internal as ST
import Control.Monad.ST.Uncurried (STFn2, STFn3, STFn4, mkSTFn2, mkSTFn3, mkSTFn4, runSTFn1, runSTFn2, runSTFn3, runSTFn4)
import Control.Plus (empty)
import Data.Array as Array
import Data.Array.ST as STArray
import Data.Compactable (compact)
import Data.Maybe (Maybe(..))
import Data.Newtype (class Newtype, over, un)
import Data.Reflectable (class Reflectable, reflectType)
import Data.Symbol (class IsSymbol)
import Data.Tuple (Tuple(..))
import Data.Tuple.Nested (type (/\), (/\))
import Deku.Do as Deku
import Deku.Internal.Entities (DekuChild(..), DekuElement, DekuParent(..), DekuText, fromDekuElement, toDekuElement)
import Deku.Internal.Region (BoundAnchor(..), DekuRegion(..), managedRegion, matchBound, newBound, pushRegionEnd, readBound, regionEnd, shiftRegion)
import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn2, EffectFn3, mkEffectFn1, mkEffectFn2, runEffectFn1, runEffectFn2, runEffectFn3)
import FRP.Event as Event
import FRP.Poll (Poll(..))
import FRP.Poll as Poll
import FRP.Poll.Unoptimized as UPoll
import Foreign.Object as Object
import Partial.Unsafe (unsafePartial)
import Prim.Row as Row
import Prim.RowList as RL
import Record (get)
import Safe.Coerce (coerce)
import Type.Proxy (Proxy(..))
import Web.DOM (DocumentFragment, Element)
import Web.Event.Internal.Types (Event)
import Web.HTML (HTMLTemplateElement)

-- | A callback function that can be used as a value for a listener.
newtype Key = Key String
newtype Value = Value String
newtype Cb = Cb (Event -> Effect Boolean)

derive instance newtypeCb :: Newtype Cb _
instance eqCb :: Eq Cb where
  eq _ _ = false

instance ordCb :: Ord Cb where
  compare _ _ = LT

instance showCb :: Show Cb where
  show _ = "{callback}"

-- | Construct a `cb`. This is an alias for the newtype constructor.
cb :: (Event -> Effect Unit) -> Cb
cb = Cb <<< ((map <<< map) (const true))

prop' :: String -> String -> Attribute'
prop' k v = mkEffectFn2 \e (DOMInterpret { setProp }) ->
  runEffectFn3 setProp (Key k) (Value v) (toDekuElement e) 

cb' :: String -> Cb -> Attribute'
cb' k v = mkEffectFn2 \e (DOMInterpret { setCb }) ->
  runEffectFn3 setCb (Key k) v (toDekuElement e)

unset' :: String -> Attribute'
unset' k = mkEffectFn2 \e (DOMInterpret { unsetAttribute }) ->
  runEffectFn2 unsetAttribute (Key k) (toDekuElement e)

type Attribute' = EffectFn2 Element DOMInterpret Unit

-- | Low level representation of key-value pairs for attributes and listeners.
-- | In general, this type is for internal use only. In practice, you'll use
-- | the `:=` family of operators and helpers like `style` and `klass` instead.
newtype Attribute :: forall k. k -> Type
newtype Attribute i = Attribute Attribute'

-- | For internal use only, exported to be used by other modules. Ignore this.
unsafeUnAttribute
  :: forall e. Attribute e -> EffectFn2 Element DOMInterpret Unit
unsafeUnAttribute = coerce

-- | For internal use only, exported to be used by other modules. Ignore this.
unsafeAttribute
  :: forall e. EffectFn2 Element DOMInterpret Unit -> Attribute e
unsafeAttribute = Attribute

attributeAtYourOwnRisk :: forall e. String -> String -> Attribute e
attributeAtYourOwnRisk k v = unsafeAttribute $ mkEffectFn2 \e (DOMInterpret { setProp }) ->
  runEffectFn3 setProp (Key k) (Value v) (toDekuElement e)

callbackWithCaution :: forall e. String -> (Event -> Effect Boolean) -> Attribute e
callbackWithCaution k v = unsafeAttribute $ mkEffectFn2 \e (DOMInterpret { setCb }) ->
  runEffectFn3 setCb (Key k) (Cb v) (toDekuElement e)

-- | Construct a [data attribute](https://developer.mozilla.org/en-US/docs/Learn/HTML/Howto/Use_data_attributes).
xdata :: forall e. String -> String -> Attribute e
xdata k v =
  attributeAtYourOwnRisk ("data-" <> k) v

data DekuDynamic = DekuSendToPos Int | DekuRemove

newtype Tag = Tag String
newtype Namespace = Namespace String

-- | Type used by Deku backends to create an element. For internal use only unless you're writing a custom backend.
type MakeElement =
  EffectFn2 (Maybe Namespace) Tag DekuElement

type RemoveElement = EffectFn1 DekuElement Unit
type RemoveText = EffectFn1 DekuText Unit

-- | Type used by Deku backends to give a parent to an element. For internal use only unless you're writing a custom backend.
type AttachElement =
  EffectFn2 DekuChild BoundAnchor Unit

type AttachText =
  EffectFn2 DekuText BoundAnchor Unit

type AssociateUnsubsToText = EffectFn2 DekuText (Array (Effect Unit)) Unit

type AssociateUnsubsToElement = EffectFn2 DekuElement (Array (Effect Unit))
  Unit

-- | Type used by Deku backends to construct a text element. For internal use only unless you're writing a custom backend.
type MakeText = EffectFn1 (Maybe String) DekuText

-- | Type used by Deku backends to set the text of a text element. For internal use only unless you're writing a custom backend.
type SetText = EffectFn2 String DekuText Unit

-- | Type used by Deku backends to unset an attribute. For internal use only unless you're writing a custom backend.
type UnsetAttribute =
  EffectFn2 Key DekuElement Unit

-- | Type used by Deku backends to set an attribute. For internal use only unless you're writing a custom backend.
type SetProp = EffectFn3 Key Value DekuElement Unit

-- | Type used by Deku backends to set a listener. For internal use only unless you're writing a custom backend.
type SetCb =
  EffectFn3 Key Cb DekuElement Unit

-- | Moves all `Element` and `Text` nodes between `fromBegin` and `fromEnd` after the node pointed to by `after`
type BeamRegion =
  EffectFn3 BoundAnchor BoundAnchor BoundAnchor Unit

type MakeTemplate = EffectFn1 String HTMLTemplateElement
type CloneElement = EffectFn1 Element Element
type CloneTemplate = EffectFn1 HTMLTemplateElement Element
type TemplateContent = EffectFn1 HTMLTemplateElement DocumentFragment


-- | This is the interpreter that any Deku backend creator needs to impelement.
-- | Three interpreters are included with Deku: SPA.
-- , SSR, and hydrated SSR.
newtype DOMInterpret = DOMInterpret
  { makeElement :: MakeElement
  , setProp :: SetProp
  , setCb :: SetCb
  , unsetAttribute :: UnsetAttribute
  , attachElement :: AttachElement
  , removeElement :: RemoveElement
  --
  , makeText :: MakeText
  , setText :: SetText
  , attachText :: AttachText
  , removeText :: RemoveText
  -- 
  , beamRegion :: BeamRegion
  --
  , makeTemplate :: MakeTemplate
  , cloneElement :: CloneElement
  , cloneTemplate :: CloneTemplate
  , templateContent :: TemplateContent
  }
derive instance Newtype DOMInterpret _

collectUnsubs :: EffectFn1 PSR ( STArray.STArray Global ( Effect Unit ) )
collectUnsubs = mkEffectFn1 \( PSR psr ) -> do
  unsubs <- liftST $ STArray.new
  when ( not ( Array.null psr.unsubs ) ) do
    void $ liftST $ STArray.pushAll psr.unsubs unsubs
  pure unsubs

disposeUnsubs :: EffectFn1 ( STArray.STArray Global ( Effect Unit ) ) Unit
disposeUnsubs = mkEffectFn1 \unsubs -> do
  runEffectFn1 Event.fastForeachThunkE =<< liftST ( STArray.unsafeFreeze unsubs )

-- | Handles an optimized `Poll` by running the effect on each emitted value. Any resulting subscription gets written to 
-- | given cleanup array.
pump :: forall a
   . STArray.STArray Global (Effect Unit)
  -> Poll a
  -> EffectFn1 a Unit
  -> Effect Unit
pump associations p eff =
  go p
  
  where

  handleEvent :: Event.Event a -> Effect Unit
  handleEvent y = do
    uu <- runEffectFn2 Event.subscribeO y eff
    void $ liftST $ STArray.push uu associations

  go :: Poll a -> Effect Unit
  go = case _ of
    OnlyEvent x -> handleEvent x
    OnlyPure x -> runEffectFn2 Event.fastForeachE x eff
    OnlyPoll x -> do
      bang <- liftST $ Event.create
      handleEvent ( UPoll.sample x bang.event )
      bang.push identity
    PureAndEvent x y -> do
      go ( OnlyPure x )
      go ( OnlyEvent y )
    PureAndPoll x y -> do
      go ( OnlyPure x )
      go ( OnlyPoll y )

newtype PSR = PSR
  { parent :: DekuRegion
  , unsubs :: Array (Effect Unit)
  , lifecycle :: Poll.Poll Unit
  }
derive instance Newtype PSR _

newtype Nut =
  Nut (EffectFn2 PSR DOMInterpret Unit)

instance Semigroup Nut where
  append ( Nut a ) ( Nut b ) =
    Nut $ mkEffectFn2 \psr di -> do
      -- unrolled version of `fixed`
      -- first `Nut` should not handle all unsubs, they may still be needed for later elements
      runEffectFn2 a ( over PSR _ { unsubs = [] } psr ) di 
      runEffectFn2 b psr di
      
instance Monoid Nut where
  mempty =
    Nut $ mkEffectFn2 \psr _ -> do
      -- while we contribute no UI elements we still have to handle any unsubs created by our hooks
      unsubs <- runEffectFn1 collectUnsubs psr
      
      let 
        handleLifecycle :: EffectFn1 Unit Unit
        handleLifecycle =
          mkEffectFn1 \_ -> runEffectFn1 disposeUnsubs unsubs

      pump unsubs ( un PSR psr ).lifecycle handleLifecycle

-- hooks

type Hook' a r = (a -> r) -> Nut
type Hook a = (a -> Nut) -> Nut

useDeflect :: forall a. Poll a -> Hook (Poll a)
useDeflect e f = Nut $ mkEffectFn2 \psr di -> do
  d <- liftST $ Poll.deflect e
  runEffectFn2 (coerce $ f d) psr di

useHot
  :: forall a
   . a
  -> Hook ((a -> Effect Unit) /\ Poll a)
useHot a f = Deku.do
  push /\ poll <- useState'
  r <- useRefST a poll
  f (push /\ (Poll.stToPoll r <|> poll))

useHotRant :: forall a. Poll a -> Hook (Poll a)
useHotRant e f = Deku.do
  r <- useRefST Nothing (Just <$> e)
  p <- useRant e
  -- we `once e` in case it has an initial value
  f $ compact (Poll.stToPoll r <|> (Just <$> p))

useMailboxed
  :: forall a b
   . Ord a
  => Hook (({ address :: a, payload :: b } -> Effect Unit) /\ (a -> Poll b))
useMailboxed f = Nut $ mkEffectFn2 \psr di -> do
  { poll, push } <- liftST $ Poll.mailbox
  runEffectFn2 (coerce $ f (push /\ poll)) psr di

useMailboxedS
  :: forall b
   . Hook
       ( ({ address :: String, payload :: b } -> Effect Unit) /\
           (String -> Poll b)
       )
useMailboxedS f = Nut $ mkEffectFn2 \psr di -> do
  { poll, push } <- liftST $ Poll.mailboxS
  runEffectFn2 (coerce $ f (push /\ poll)) psr di

useRant :: forall a. Poll a -> Hook (Poll a)
useRant e f = Nut $ mkEffectFn2 \psr di -> do
  { poll, unsubscribe } <- liftST $ Poll.rant e
  runEffectFn2 (coerce $ f poll) (withUnsub (liftST unsubscribe) psr) di

useSplit :: forall a. Poll a -> Hook { first :: Poll a, second :: Poll a }
useSplit e f = Nut $ mkEffectFn2 \psr di -> do
  { poll, unsubscribe } <- liftST $ Poll.rant e
  p0 <- liftST $ Poll.create
  p1 <- liftST $ Poll.create
  e0 <- liftST $ Event.create
  o <- Event.subscribe (Poll.sample poll e0.event) \i -> do
    p0.push i
    p1.push i
  e0.push identity
  runEffectFn2 (coerce $ f { first: p0.poll, second: p1.poll })
    (withUnsub (o *> liftST unsubscribe) psr)
    di

useRant'
  :: forall t a
   . (Poll t -> Poll a)
  -> Hook ((t -> Effect Unit) /\ Poll a)
useRant' f0 f1 = Deku.do
  push /\ e <- useState'
  m <- useRant (f0 e)
  f1 (push /\ m)

useRef :: forall a. a -> Poll a -> Hook (Effect a)
useRef a b f = Deku.do
  r <- useRefST a b
  f (liftST r)

withUnsub :: Effect Unit -> PSR -> PSR
withUnsub u (PSR psr) = PSR $ psr { unsubs = Array.snoc psr.unsubs u }

useRefST :: forall a. a -> Poll a -> Hook (ST.ST Global a)
useRefST a e f = Nut $ mkEffectFn2 \psr di -> do
  r <- liftST $ ST.new a
  { event, push } <- liftST $ Event.create
  u <- Event.subscribe (Poll.sample e event) \i -> void $ liftST $ ST.write i r
  push identity
  let Nut nut = f ( ST.read r )
  runEffectFn2 nut ( withUnsub u psr ) di

useState' :: forall a. Hook ((a -> Effect Unit) /\ Poll a)
useState' f = Nut $ mkEffectFn2 \psr di -> do
  { poll, push } <- liftST $ Poll.create
  let Nut nut = f (push /\ poll)
  runEffectFn2 nut psr di

useStateTagged' :: forall a. String -> Hook ((a -> Effect Unit) /\ Poll a)
useStateTagged' tag f = Nut $ mkEffectFn2 \psr di -> do
  { poll, push } <- liftST $ Poll.createTagged tag
  let Nut nut = f (push /\ poll)
  runEffectFn2 nut psr di

useState :: forall a. a -> Hook ((a -> Effect Unit) /\ Poll a)
useState a f = Nut $ mkEffectFn2 \psr di -> do
  { poll, push } <- liftST $ Poll.create
  let Nut nut = f (push /\ (pure a <|> poll))
  runEffectFn2 nut psr di

-- dyn
type DynOptions v =
  { sendTo :: v -> Poll Int, remove :: v -> Poll Unit }

dynOptions :: forall v. DynOptions v
dynOptions = { sendTo: \_ -> empty, remove: \_ -> empty }

useDyn
  :: forall value
   . Poll (Tuple (Maybe Int) value)
  -> Hook
       { value :: value
       , remove :: Effect Unit
       , sendTo :: Int -> Effect Unit
       }
useDyn p = useDynWith p dynOptions

useDynAtBeginning
  :: forall value
   . Poll value
  -> Hook
       { value :: value
       , remove :: Effect Unit
       , sendTo :: Int -> Effect Unit
       }
useDynAtBeginning b = useDynAtBeginningWith b dynOptions

useDynAtBeginningWith
  :: forall value
   . Poll value
  -> DynOptions value
  -> Hook
       { value :: value
       , remove :: Effect Unit
       , sendTo :: Int -> Effect Unit
       }
useDynAtBeginningWith e = useDynWith (map (Just 0 /\ _) e)

useDynAtEnd
  :: forall value
   . Poll value
  -> Hook
       { value :: value
       , remove :: Effect Unit
       , sendTo :: Int -> Effect Unit
       }
useDynAtEnd b = useDynAtEndWith b dynOptions

useDynAtEndWith
  :: forall value
   . Poll value
  -> DynOptions value
  -> Hook
       { value :: value
       , remove :: Effect Unit
       , sendTo :: Int -> Effect Unit
       }
useDynAtEndWith e = useDynWith (map (Nothing /\ _) e)

useDynWith
  :: forall value
   . Poll ( Tuple ( Maybe Int ) value )
  -> DynOptions value
  -> Hook
       { value :: value
       , remove :: Effect Unit
       , sendTo :: Int -> Effect Unit
       }
useDynWith elements options cont = Nut $ mkEffectFn2 \psr di -> do
  managed <- liftST $ runSTFn1 managedRegion ( un PSR psr ).parent
  regions <- liftST STArray.new
  lifecycle <- liftST Poll.create
  unsubs <- runEffectFn1 collectUnsubs psr
  
  let
    handleElements :: EffectFn1 ( Tuple ( Maybe Int ) value ) Unit
    handleElements = mkEffectFn1 \( Tuple initialPos value ) -> do
      eltSendTo <- liftST Poll.create
      let
        sendTo :: Poll Int
        sendTo =
          Poll.merge [ options.sendTo value, eltSendTo.poll ] 

      eltRemove <- liftST Poll.create
      let      
        remove :: Poll Unit
        remove =
          Poll.merge [ options.remove value, eltRemove.poll, lifecycle.poll ]


      elt <- liftST do
        case initialPos of
          Just pos -> do
            query <- STArray.peek pos regions
            case query of
              Just { region : before } -> do
                region <- runSTFn1 shiftRegion before
                ix <- ST.new pos
                runSTFn2 fixDynRegion pos regions
                pure { ix, region }

              Nothing ->
                runSTFn2 pushDynRegion managed regions

          Nothing -> do
            runSTFn2 pushDynRegion managed regions

      eltUnsubs <- liftST STArray.new
      let
        Nut nut = cont
          { value
          , remove : eltRemove.push unit
          , sendTo : eltSendTo.push
          }
        
        eltPSR :: PSR
        eltPSR =
          PSR
            { parent : elt.region
            , unsubs : []
            , lifecycle : remove
            }

        handleManagedLifecycle :: EffectFn1 Unit Unit
        handleManagedLifecycle =
          mkEffectFn1 \_ -> do
            liftST $ runSTFn3 deleteDynRegion elt managed regions 
            runEffectFn1 disposeUnsubs eltUnsubs

        handleSendTo :: EffectFn1 Int Unit
        handleSendTo = mkEffectFn1 \newPos -> do
          fromBegin <- liftST $ runSTFn1 readBound ( un DekuRegion elt.region ).begin
          fromEnd <- liftST $ runSTFn1 readBound ( un DekuRegion elt.region ).end

          liftST $ runSTFn3 deleteDynRegion elt managed regions
          liftST $ runSTFn4 insertDynRegion newPos elt managed regions

          target <- liftST $ runSTFn1 readBound ( un DekuRegion elt.region ).begin
          runEffectFn3 ( un DOMInterpret di ).beamRegion fromBegin fromEnd target

      pump eltUnsubs sendTo handleSendTo
      pump eltUnsubs remove handleManagedLifecycle

      runEffectFn2 nut eltPSR di

    handleDynLifecycle :: EffectFn1 Unit Unit
    handleDynLifecycle = mkEffectFn1 \_ -> do
      -- first let children dispose of themselves
      lifecycle.push unit
      -- and only then unsub
      runEffectFn1 disposeUnsubs unsubs
    
  pump unsubs elements handleElements
  pump unsubs ( un PSR psr ).lifecycle handleDynLifecycle

type DynRegion =
  { ix :: ST.STRef Global Int
  , region :: DekuRegion
  }

-- | Adds a new DynRegion at end of the managed DynRegion array.
pushDynRegion :: STFn2 DekuRegion ( STArray.STArray Global DynRegion ) Global DynRegion
pushDynRegion = mkSTFn2 \managed regions -> do
  region <- runSTFn1 managedRegion managed
  ix <- ST.new =<< STArray.length regions
  let el = { ix, region }
  void $ STArray.push el regions
  pure el

deleteDynRegion :: STFn3 DynRegion DekuRegion ( STArray.STArray Global DynRegion ) Global Unit
deleteDynRegion = mkSTFn3 \{ ix, region : DekuRegion delete } ( DekuRegion managed ) regions -> do
  currentPos <- ST.read ix
  query <- STArray.peek ( currentPos + 1 ) regions
  case query of
    Just { region : DekuRegion following } ->
      runSTFn2 matchBound delete.begin following.begin 

    Nothing ->
      -- element to delete was at end so we fix the end of the managed region instead
      runSTFn2 matchBound delete.begin managed.end
      
  void $ STArray.splice currentPos 1 [] regions
  
insertDynRegion :: STFn4 Int DynRegion DekuRegion ( STArray.STArray Global DynRegion ) Global Unit
insertDynRegion = mkSTFn4 \pos el@{ region : DekuRegion insert } ( DekuRegion managed ) regions -> do
  qtarget <- STArray.peek pos regions
  case qtarget of
    Just { region : DekuRegion target } -> do
      runSTFn2 matchBound target.begin insert.begin
      runSTFn2 matchBound insert.end target.begin
  
    Nothing -> do
      -- at end or out of range
      runSTFn2 matchBound managed.end insert.begin
      runSTFn2 matchBound insert.end managed.end

  void $ STArray.splice pos 0 [ el ] regions

  runSTFn2 fixDynRegion pos regions

-- | Updates all indices in the region array to point to their correct position again.
fixDynRegion :: STFn2 Int ( STArray.STArray Global DynRegion ) Global Unit
fixDynRegion = mkSTFn2 \ix regions -> do
  length <- STArray.length regions
  -- | Cast array for easier access
  arr <- STArray.unsafeFreeze regions
  ST.for ix length \i -> do
    void $ ST.write i ( unsafePartial ( Array.unsafeIndex arr i ) ).ix

fixed :: Array Nut -> Nut
fixed nuts = Nut $ mkEffectFn2 \psr di -> do
  let
    cleared :: PSR
    cleared =
      over PSR _ { unsubs = [] } psr

    handleNuts :: EffectFn1 Nut Unit
    handleNuts = mkEffectFn1 \( Nut nut ) ->
      runEffectFn2 nut cleared di
  
    Nut dispose = mempty

  -- run `nuts` without `unsubs` so they can't dispose them
  runEffectFn2 Event.fastForeachE nuts handleNuts
  -- run an empty `Nut` to actually dispose the `unsubs`
  runEffectFn2 dispose psr di

elementify
  :: forall element
   . Maybe String
  -> String
  -> Array (Poll (Attribute element))
  -> Array Nut
  -> Nut
elementify ns tag arrAtts nuts = Nut $ mkEffectFn2 \psr di -> do
  elt <- runEffectFn2 ( un DOMInterpret di ).makeElement ( Namespace <$> ns ) ( Tag tag )
  regionEnd <- liftST $ runSTFn1 regionEnd ( un PSR psr ).parent
  runEffectFn2 ( un DOMInterpret di ).attachElement ( DekuChild elt ) regionEnd
  liftST $ runSTFn2 pushRegionEnd ( Element ( elt ) ) ( un PSR psr ).parent

  unsubs <- runEffectFn1 collectUnsubs psr

  let
    handleAtts :: EffectFn1 ( Poll ( Attribute element ) ) Unit
    handleAtts = mkEffectFn1 \atts ->
      pump unsubs atts $ mkEffectFn1 \( Attribute x ) ->
        runEffectFn2 x (fromDekuElement elt) di
  runEffectFn2 Event.fastForeachE arrAtts handleAtts

  eltRegion <- liftST do
    begin <- runSTFn1 newBound ( ParentStart ( DekuParent elt ) )
    end <- runSTFn1 newBound ( ParentStart ( DekuParent elt ) )
    pure $ DekuRegion { begin, end }
  let
    handleNuts :: EffectFn1 Nut Unit
    handleNuts = mkEffectFn1 \( Nut nut ) ->
      runEffectFn2 nut 
        ( PSR
          { unsubs : []
          , lifecycle : ( un PSR psr ).lifecycle
          , parent : eltRegion
          }
        )
        di
  runEffectFn2 Event.fastForeachE nuts handleNuts

  let 
    handleLifecycle :: EffectFn1 Unit Unit
    handleLifecycle = mkEffectFn1 \_ -> do
      runEffectFn1 ( un DOMInterpret di ).removeElement elt
      runEffectFn1 disposeUnsubs unsubs

  pump unsubs ( un PSR psr ).lifecycle handleLifecycle

text_ :: String -> Nut
text_ txt =
  text ( pure @Poll txt )

text :: Poll String -> Nut
text texts = Nut $ mkEffectFn2 \psr di -> do
  unsubs <- runEffectFn1 collectUnsubs psr
  
  let
    handleTextUpdate :: EffectFn2 ( Event.Event String ) DekuText Unit
    handleTextUpdate = mkEffectFn2 \xs txt -> do
      sub <- runEffectFn2 Event.subscribeO xs $ mkEffectFn1 \x ->
        runEffectFn2 ( un DOMInterpret di ).setText x txt
      void $ liftST $ STArray.push sub unsubs

  txt <- case texts of 
    OnlyPure xs -> do
      runEffectFn1 ( un DOMInterpret di ).makeText ( Array.last xs )
    
    OnlyEvent e -> do
      txt <- runEffectFn1 ( un DOMInterpret di ).makeText Nothing 
      runEffectFn2 handleTextUpdate e txt
      pure txt

    OnlyPoll p -> do
      txt <- runEffectFn1 ( un DOMInterpret di ).makeText Nothing 
      bang <- liftST Event.create 
      runEffectFn2 handleTextUpdate ( UPoll.sample p bang.event ) txt
      bang.push identity
      pure txt

    PureAndEvent xs e -> do
      txt <- runEffectFn1 ( un DOMInterpret di ).makeText ( Array.last xs )
      runEffectFn2 handleTextUpdate e txt
      pure txt

    PureAndPoll xs p -> do
      txt <- runEffectFn1 ( un DOMInterpret di ).makeText ( Array.last xs ) 
      bang <- liftST Event.create 
      runEffectFn2 handleTextUpdate ( UPoll.sample p bang.event ) txt
      bang.push identity
      pure txt
  
  regionEnd <- liftST $ runSTFn1 regionEnd ( un PSR psr ).parent
  runEffectFn2 ( un DOMInterpret di ).attachText txt regionEnd

  let
    handleLifecycle :: EffectFn1 Unit Unit
    handleLifecycle = mkEffectFn1 \_ -> do
      runEffectFn1 ( un DOMInterpret di ).removeText txt
      runEffectFn1 disposeUnsubs unsubs

  pump unsubs ( un PSR psr ).lifecycle handleLifecycle

-- portal :: Nut -> Hook Nut
-- portal (Nut toBeam) f = Nut $ mkEffectFn2
--   \psr
--    di@(DOMInterpret { makeElement }) ->
--     do
--       frag <- runEffectFn2 makeElement Nothing (Tag "div")
--       beamMe <- runEffectFn2 toBeam
--         ( PSR
--             { parent: frag
--             , fromPortal: true
--             , unsubs: []
--             , beacon: Nothing
--             }
--         )
--         di
--       let giveNewParent = Nut $ oh'hi beamMe
--       let Nut nut = f giveNewParent
--       runEffectFn2 nut psr di
--   where
--   oh'hi beamMe = mkEffectFn2
--     \ps
--      di -> do
--       case beamMe of
--         -- if the outcome is an element, just move it
--         DekuElementOutcome elt -> runEffectFn3 eltAttribution ps di elt
--         -- if the outcome is a text, just move it
--         DekuTextOutcome txt -> runEffectFn3 textAttribution ps di txt
--         --beacon
--         DekuBeaconOutcome stBeacon -> do
--           -- if the outcome is a beacon and the beacon's parent is an element, we're in for a slog, itearte over the whole thing
--           runEffectFn3 beaconAttribution ps di stBeacon
--         NoOutcome -> pure unit
--       pure beamMe

-- pursx

data PursXable = PXAttr (Poll Attribute') | PXStr String | PXNut Nut

class
  PursxToElement (rl :: RL.RowList Type) (r :: Row Type)
  | rl -> r where
  pursxToElement
    :: Proxy rl
    -> { | r }
    -> Object.Object PursXable

instance pursxToElementConsNut ::
  ( Row.Cons key Nut r' r
  , PursxToElement rest r
  , Reflectable key String
  , IsSymbol key
  ) =>
  PursxToElement
    (RL.Cons key (Nut) rest)
    r where
  pursxToElement _ r = do
    let
      o = pursxToElement (Proxy :: Proxy rest) r
    Object.insert (reflectType pxk) (PXNut (get pxk r)) o
    where
    pxk = Proxy :: _ key

else instance pursxToElementConsAttr ::
  ( Row.Cons key (Poll (Attribute deku)) r' r
  , PursxToElement rest r
  , Reflectable key String
  , IsSymbol key
  ) =>
  PursxToElement
    (RL.Cons key (Poll (Attribute deku)) rest)
    r where
  pursxToElement _ r = do
    let
      o = pursxToElement (Proxy :: Proxy rest) r
    Object.insert (reflectType pxk)
      (PXAttr (unsafeUnAttribute <$> (get pxk r)))
      o
    where
    pxk = Proxy :: _ key

else instance pursxToElementConsStr ::
  ( Row.Cons key String r' r
  , PursxToElement rest r
  , Reflectable key String
  , IsSymbol key
  ) =>
  PursxToElement
    (RL.Cons key String rest)
    r where
  pursxToElement _ r = do
    let
      o = pursxToElement (Proxy :: Proxy rest) r
    Object.insert (reflectType pxk)
      (PXStr (get pxk r))
      o
    where
    pxk = Proxy :: _ key

instance pursxToElementNil ::
  PursxToElement RL.Nil r where
  pursxToElement _ _ = Object.empty
