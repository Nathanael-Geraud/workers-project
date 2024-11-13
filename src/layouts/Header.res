let images = ["/img/1.jpg", "/img/2.jpg"]

@react.component
let make = (~interval: int) => {

  let (currentIndex, setCurrentIndex) = React.useState(() => 0)

  React.useEffect(() => {
    let timer = Js.Global.setInterval(() => {
      setCurrentIndex(currentIndex => mod(currentIndex + 1, Array.length(images)))
    }, interval)

    Some(() => {Js.Global.clearInterval(timer)})
  }, [currentIndex])

  <div className="slider relative">
    <img
      src={Option.getOr(images[currentIndex], "")}
      alt="Slider image"
      className="w-full h-full object-cover"
    />
    <div className="absolute inset-20 flex flex-col justify-center items-center h-full">
      <div className="relative z-20 text-center">
        <h1
          className="text-balance text-5xl font-semibold tracking-tight text-gray-900 sm:text-7xl">
          {React.string("Reserver un service")}
        </h1>
        <p className="mt-8 text-pretty text-lg font-medium sm:text-xl">
          {React.string(
            "Reservez un service de qualite aupres de nos expert pour tout vos travaux a domicile",
          )}
        </p>
        <div className="mb-80 mt-10 flex items-center justify-center gap-x-6">
          <div>
            <div className="relative mt-2 flex items-center">
              <input
                className="block w-full rounded-l-md border-0 px-4 py-2 text-gray-900 ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm"
                placeholder="Rechercher"
              />
              <button
                className="h-full px-4 py-2 bg-indigo-600 text-white rounded-r-md hover:bg-indigo-700 focus:outline-none">
                {React.string("Rechercher")}
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
}
